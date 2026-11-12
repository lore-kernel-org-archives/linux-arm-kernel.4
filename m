Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E30606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 02:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7ai5CFr;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bH0NypY8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=; b=y7ai5CFrT+Npzp
	GBA/szNpH7WDfNqWNdP0QCrKrnmyTP4ErUV4KVJq/+taKXZmIod4e0h0XGuRw4X7WBviO43eqXePI
	GLZpbVbijs5NHFICyoKPYtM+JsBUZe/1CNoq4HPIrr+vJJJquNXsuVbTuAZlvS9XX0ArWpnRK2gFr
	PU15tZSPmQ6j+of6MwXzwDL9X1XcyXxP54A7gXJ+NIi/b5XvIg9UW/7cdf/XjwKndNOx9Oj1mBvpV
	iWB4WnwcTF+SWfybB841wkBgqhrEXkiTwooDWGKwfA2kHrkfeaGeRiEAJVdIraN5IeF+y3VJuJx4w
	zXhfVPLlaBSbxp462PmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKcj-00000008X1X-1QPn;
	Thu, 12 Nov 2026 02:33:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKcW-00000008Wzv-2vo4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 02:33:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ea7987517aso20933715ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 18:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794450780; x=1795055580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
        b=bH0NypY8qSSCh3ilmlQGZjTx5O/EPfYxDfj8iW3ek0sZ0r2uH4Z/OPOMqnNXXqdfAu
         AMvxi9VGJEeDme+FF0UZv1iwyucqlh33GmEEgpf+fH+kGh2C2FdLXvXW/BxgVbJFfybu
         1uTsK2wUBnZkafoquWaXqMAOEZcOFoYGUyYjrdK/e1pliyJBHVGsiKcy5/TgIzmKmVmh
         3y3WS9UkcJ5xy9s2+smYHrVPQcUj1A/5xYFxxVzFB0NeVKk1QkpgR4807/+smXRbpR2N
         quGDU7zJT4mYfoeNk3Hd2U7Y++gCC2a+F+Nlgm+g5HFoEA44DNbCWFdng0+zlSsASCVj
         bVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794450780; x=1795055580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+BRgZi/ru4kt6Z44lXsT8xtnCbwbkOnntJWrR5mZ6uk=;
        b=wbYGEPOfwIYqFAODZ6Br075ZCTAMnB+3+mXMv2ygr+XNNe7zO7iaR+oVOY1T0YuJEN
         8DKfaO7JcD5ywVArBmXbfcrGEBL9JVSmY1mrq3cxCe0B2qCjG5JKuzDkAe1cag4KdXvq
         E2/HWjh6vFtd/htNkFABy38uIx7ebWwbIH/DotD/vt+PUiOBB0PrDJo1gFE2jPvOsNTZ
         nAXNTnlnNQwfMGaykTSWIZGnG7fnMNjV6+FA5aVdIt9b46DTKdKhY0Z16T1lZ1RsXLe7
         C1J5CMdoP8daS0jqHTKlpuateuVpGzVpC0dYsa3wtw6SFmj3Jpv+kd5WwIZmDKjjNKsP
         6YnQ==
X-Forwarded-Encrypted: i=1; AL+hErGenxfCvQbyPbri1i8/6S50m4xz89/NXGHac8lusM8VW+BOL/qqQYC74QWBQ37/igFRNFjr25I9VdOWmohyaLVh@lists.infradead.org
X-Gm-Message-State: APuU4Z9Wslw54l7Rkh7dWY8WU523ppnEnOIRop6v7kDEH6ewj8n6+jSK
	/jyZGfPmn4Yh9zzYXflJH5ESLLU0bIMWSv41cjArBSr5kwEI8cJkBr2L
X-Gm-Gg: AYBFou0XmL/YtIYNKWqEKKu8kXDUY6fXgpvDYA6b6hRB+NtV8AUqI593l0Vb7HpBeuo
	TKDVISRA7N+y4zMWb16Rtna2I5Pl4We7joinoJnvONuXN1h+PUJgWTbIqzNwj17dHlVO0v8dgi1
	3JCU3QANR79DPDCWy6cRZHeNlp0HSNz/exegK2PrIkVgsbQO/FfxdWqKPyQso9/F08we8vJ/52x
	Dt5SZEuPcTfMU/hO6lFkN3ZXkM3D1dKTAIpM0VJgCHc6OAStTLKHga2rTO3PAFoSpVKsTUbHWJB
	wSzJoZiZ0kzol+i8QFz+snIDVyomqaOBPZjvLWApafMlg4v7QO66N1/8wVwUhlE/wROxvCJK63U
	s3FMWwxagbS8nXJjeSryv0r2XfuyK05hmaqAr+gfgwTL0sjfmFw+0GOstqa66TKofokfCPojPgd
	2xq2Yfk9g0rk01IkL3lVN1o+KSp5+i5fHjxhvt1iFdK6O9kiRjUKdS3I3sXEqJ7gLZB/LmzQL3Z
	Z2hCt3WZcNsoVasjxnjNd+/JmZx/Y883qvIO1Nt1S0t1S5hnBsdli1K3mULl01dxB18CgRV5OXW
	pDgVooFmvQDJaRk455pADg0vrhHQ8abBknBKHRFd3MINLBl/
X-Received: by 2002:a17:903:32c6:b0:2e8:1910:e398 with SMTP id d9443c01a7336-2edd76d5e01mr46318665ad.9.1794450779567;
        Wed, 11 Nov 2026 18:32:59 -0800 (PST)
Received: from ubuntu24.vpn.host.chaitin.net ([124.77.124.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb68204d4sm26378855ad.0.2026.11.11.18.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:32:59 -0800 (PST)
From: Yuansheng Yang <0xbeac@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [RFC PATCH] mmc: tmio: disable dma_issue work before releasing DMA
Date: Thu, 12 Nov 2026 10:32:53 +0800
Message-ID: <20261112023253.7607-1-0xbeac@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <avRXf6SJuXxslsbx@ninjato>
References: <20261101063739.89331-1-0xbeac@gmail.com> <avRXf6SJuXxslsbx@ninjato>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_183300_765635_C964D17D 
X-CRM114-Status: UNSURE (   7.87  )
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

Hi Wolfram,

Apologies for the handle in the Signed-off-by.  I have resent the patch
with my real name, Yuansheng Yang, in From: and Signed-off-by:.  Only the
author identity changed; the code is identical to the RFC.

Thanks,
Yuansheng Yang

