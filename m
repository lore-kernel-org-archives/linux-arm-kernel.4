Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B0606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 03:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UH77FO7N;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DpvmY1ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=; b=UH77FO7NR40VHB
	E+wAe4gbA6wohlTEkLx2O81XBE/N6m5jzqXb4cM7e/j1Fa8+URJnaOQjMW3wmiyaSCaK85NlLWEVY
	Hd3mLolC9d1MRYg4fNoiQYK8h6ag2CTfzaKAzD7FGDaRxGO4sSDavluC8Fz/yfFnldscJuhVTSINb
	g5pZmuyseg8N0TI04KAGoj3+UtXfLT4LS0Vbd96BhEgwCADJKYWFeEpnAOtgCdlWHPkhlQ9Cern0J
	HT3vJfA5rB9FGfSVsKzO36mxDzWL+vAOZlMFMCh9+I8cQ2GIfRnGFCtUiUdVCt7J9Vvt70lXaV1fu
	OX59QYyeanqpE5iz9LOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPjY-0000000BwrH-3Q4L;
	Thu, 26 Nov 2026 03:01:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWPjW-0000000Bwq5-0Ift
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 03:01:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f02b9c1f6fso45025865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 19:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795662073; x=1796266873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
        b=DpvmY1ngVcM93JzvUTxoyC/cPFiY7RFTLa/1qvqaube4imByW3nfZg997Z3CB8KKXD
         TNseA6W/Bem8g+JVl87/kNtkAhiMbAIHJWAgD5EpDj/Ck1ipgn7kvprhcIJuCyntZm5i
         mKdQi2wqye1x1ZxP3TZMGAK7MWZo3IewxlpIMoZBv1UNKUfqWNXZWPBISo7u+yc2rtaw
         tYiRi/KOlGHNags8fiLy5jf4TeUiso6UhJbHaMxHiFSWZsHv1Henk9E5+IZ1feAd1tb7
         OWou783c4eWcuvVqWhR2/YxLLZ/itC6HSGFj6zjUEURdew8rMhsgHwACAP8raw2FE1S5
         oW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795662073; x=1796266873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNvdqA1uwKCTrbTS/6j2LHBMBjwVNOl1Jrgf+o6oR4s=;
        b=VdNYmCEecipMd/Gpzep0alfcdlpiY9fi4M1NLPOyNiTAsj9Ae9MgbxR0KqIn4zjuRd
         cZ1XwNZYMX7iVeAr/mTaKI10YZ2PzHqLkG24S9d7N+YCCNpwOPaQDcjPsYRUTpS1SwLL
         lrbLPw06mStShC5+7rXFX2CNmeQyJVuuvYxYRXCVfnUDUZzhBfQdWoJORu72F2+VNM94
         Ay8eKwcvDaHiRj3lDTda1XmLhK9vKSuyPaYR1zAqzDhETskrygt8zd1+1kQGnIoJBonO
         JDeYVZs9IBcekI9OSauVxWB7Uq9iaI1g8BOhCtDBdvz1uzJbCWoHFYupkp/qVVjhEnCQ
         kPVQ==
X-Forwarded-Encrypted: i=1; AL+hErHDO/eXUY7Snw0EOG9hNeKpdivVDVP746bAmrg603fkHA1To+XaiwtU+Ukyzf4yUREZKOEziWRb1lF7M0VFUXet@lists.infradead.org
X-Gm-Message-State: APuU4Z8p66N1GAxuzlwmRcXvps0EDoYmgY0m23yiijKzOHbAOpG3dhwE
	+SPtmav4AZsbTeh5ZTvDXOGt4Ol1BZCTj7y+UBNxAsHzSLFx7Td9Cab3
X-Gm-Gg: AZFdTZdzQZHr74BN19Wt7WThFbmgE9mwGnI5bpCFwfwi276c1uHloDy7FLjgYgFZ5Xu
	fn70cQqXfLSM3wj9VTtVSil4mVxnCUe1RK1KTgHbUFH5Do7fU/i+ovjcvAwu2YZB5Y+7qRJyYrd
	/iAcD+PLspv/EnvD9qZBIpY7A4MjqV03xK9u+2mFve1DbDWfkSXn5+Cmc40BuKsxRwO/jtEtVAF
	KAoE2r6950VOQq3BCzs7ELZmjpiLXVHwn2ERwJEYyBQi46NT1QZAqYhSEe+U5OxNacWQwQ8aLnN
	U/S1RcdVBog9mki7+5W+I4sdegahbGMcfBu3Ca1T8+xD4POTGONKFF1NAVV+7udever7EAkT3X8
	Rz/QWqJ8MzqJiNSuo7U6W/0xrKMPoUA+KyZawDhB4DHaHs96kR/SgxaY86fm0YvJ4O3T2xkwT+Q
	aVBbwofv7oBxLDtarLRkhNz2uELlAHUgDpcr2XFYxkx5fbA597ruwdYpoHYeHsZjGrjTOr6qd6Q
	GvmsUkUMMcGfsSdE/nwobrLroUPaLUzrvpriTSl8X8b1oSi0VtNrwNinsbR7zUBHQ9K04dR7DxV
	n3lXYdkcSSSOun5vzfxsAPdpNF72eSRrPx8=
X-Received: by 2002:a17:902:ec91:b0:2f0:d40a:cc21 with SMTP id d9443c01a7336-2f0d40ad46fmr39670185ad.22.1795662073095;
        Wed, 25 Nov 2026 19:01:13 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0d537a522sm24278755ad.47.2026.11.25.19.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 19:01:12 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: cyan@meta.com
Cc: leeonion.muyu@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	mark.rutland@arm.com,
	alex@ghiti.fr,
	emil.renner.berthing@canonical.com,
	masahiroy@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	u-boot@lists.denx.de
Subject: Re: [PATCH 0/2] arm64,riscv: boot: emit standard LZ4 frame for Image.lz4
Date: Thu, 26 Nov 2026 11:01:06 +0800
Message-Id: <20261126030106.2543652-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261126001920.3185323-1-cyan@meta.com>
References: <20261126001920.3185323-1-cyan@meta.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_190114_111731_1EC8E9E5 
X-CRM114-Status: UNSURE (   7.49  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thanks a lot for the review - and for lz4 itself!

That's a great point about independent blocks. v2 passes -BI
unconditionally on lz4 >= 1.9.0, with a build-time probe
($(LZ4) -BI -V) so hosts with older lz4 still work, exactly as
you suggested.  Verified locally that -BI produces byte-identical
output on current lz4.

v2 will follow shortly.

Thanks,
Ping

