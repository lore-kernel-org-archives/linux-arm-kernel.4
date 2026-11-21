Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC45606A683
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 00:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j/OuUpVh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MTtNe86Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=; b=j/OuUpVh85cjV6
	usvh2kzAkusUCrE1nNY3tPSMTT2x3vppWDTQYS2aZ9KCqbLu8FUkZY5VNh3XE7FXL/I0AI/0RCKy4
	8iazKAXyRk2tQIlse3vaEn3zGIbh3Yd1Lc+QPzIu0M1OXcFlUtnGA0uDIoAS7XrA3BO9W2JwIRW8o
	tfR9QFeiL5EcERiwUi4SR38NqyOhpPmEq8tlgPk5BBpCS1HkSuTqdRAfJ2ErHyKcOsDB1BxdFlFIJ
	tygbnuz/bMOilLTamsLVcU/Gl7sDCrQPgV/0UvDfrSPhkfaOIe7F06fTqTF1plxMAAhETUGk0Uqcl
	J58c1sSow74lri2f51iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYmR-0000000GUTQ-0wX0;
	Sat, 21 Nov 2026 00:16:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUYmO-0000000GUSS-2tjx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 00:16:34 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c4d28f75d62so264273066b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 16:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220190; x=1795824990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
        b=MTtNe86QmeWk8I1XQdLFzLMOocUU85aVr6Fd7lU2YU7NE8cnOU2/DWAnr6WFJHG0sb
         YEU3XLdcKHyDPPigEKjSVG7SBOYBVTf2b/yslXn75NyO8MoReuY+HEgIQpj56uEL42BP
         TFfPmhiTNnc8dMi2YX61yf8+J6xGHq758tfXhJAjYbA9XPoIOGoRTJXuObriloWu+L38
         QoPVoZtUEwG8mjKB6KsD7lMJMKFsiEiaBBkf7bBpLw+M47c4WesrsQCj77M1vRNPka87
         vFG2n64vLEKZ6Cdz/88/F4JsdKqZI56K6gFUSxPCNkQdI4IZOZ8ZnwNBGWJdhUKyuzMd
         E5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220190; x=1795824990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74mngtbu0bh2Wb5wAzXvu9Way1o05aGhqD03WL1B//I=;
        b=Rl5ER3Ypp4hbTTM6uPzeVnaxOtUmz6z+er0FeJ/yYlEgol7S4clW3r5SX2+cPHicfM
         sYlJsprM9rLDB6LCT386lfuAMvleeGKEInzdrNp1Cs/S/K2E5dhfrqxvThIUL2pHhT4h
         +vIKc2Rf2rRjItuje+FV+SBE7I5tOHX0mzAmkD7+2SYLRc27ncZ4tcR5K9DUTAktZWdw
         Eq/pAp7hszdUA+DmVDQhY4eR1vKldLerXJxZg+NAxIjwZEMbL2dls0v1GxE59878r+Yr
         ejm9VCQnmn6C79n3/7LoK9aDRkk+Ziy8p5U2QTpV2cBmc8TVHDYA6GUtRdkLjUgvRPUs
         WwtA==
X-Forwarded-Encrypted: i=1; AL+hErHIidHi0HR6H9E1e1KpIo1OOlbMPU10kCv4kPhCDiiVFv+LsiBxOYpIIjtDemqdTjUrlnasJvregs+iOnfYU3EV@lists.infradead.org
X-Gm-Message-State: APuU4Z9sksniXv/VGRyb4cY2v3ob91HDv5nBeU+8URLz78h40VhbKCyF
	3Ch7e2929Mh8nOO153b8xet5BbCoox8DTCwj5YCYO9ZXi5GQsYC83P4=
X-Gm-Gg: AZFdTZd27BlBr+rhG3BzXlD9MNs3TBLKcKb5th8lQVXrdgYUIvtmifb/vre0j1UuezS
	vw1u3U5pLKWAKLCI39lTewKMa27BYA+VmKRceROlTbM6CKLvR/k+zss8Oakx3c15erbD8yfyeNS
	5HUQmLSe9UmMH63PFLZpCV+vgsg9Zq3XfVha06JU5+TzuxR0XAIU8tdA65fPTibZJl96JlYejmS
	pm7CSczGIF1Vf9DU8mvP1cgE0nkDiPD0gRFVus4/kdaEUlJnPk9TGEM7ZWDG4pDs2hCtldj/eFE
	SyPtHah6hU54Gqa/US7nxMWN0F7Ym6NWY0SV0kdKCfCfVZgK6pEb/ktvwRlDV5jD5bMIX8v1D/2
	Yv7UoyqUV4TtE+nCCL+5TDPDkD+L23p6mwpjbH13gSvAmBa4o7c5eEEdgsVxkvpxqie/rra186q
	wWNnXicA3xf7zSt7Wc3vkxRim2DY95NqZFCaYZcWr4Ly9ynoR9Xs6Lib/4rZSmaDAXAJF3+/jJS
	UbC4qJ2Asy2clc70hY3N1fc1Vz2oRH+SYwdDuCMuer4QeEQxu3UYpqcqMqg3VrhNq3oSr0o/ocC
	+ULMhbe61HQpjtPQpqmUASkXYp9B1lnL+5Fywaci1rJxHlF+aiSZPhIi6XWh728N7kPvGnhPbHo
	KZ2t1oa36M8FoLnLjH0djk5yCTYzmnviDval8E6keIrA55Q==
X-Received: by 2002:a17:907:ea94:b0:c50:aa10:d888 with SMTP id a640c23a62f3a-c513acab9d6mr426725766b.40.1795220190364;
        Fri, 20 Nov 2026 16:16:30 -0800 (PST)
Received: from sohrab-omarchy.fritz.box (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae6663esm146454466b.21.2026.11.20.16.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:16:29 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: Nizat Mikayilli <nacht@dxdmail.cc>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Add SM8550 MDSS compatible
Date: Sat, 21 Nov 2026 01:16:27 +0100
Message-ID: <20261121001627.4091340-1-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
References: <20261107-b4-smmu-sm8550-v1-1-777d0a41170b@dxdmail.cc>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_161632_733709_AD57DCCC 
X-CRM114-Status: UNSURE (   9.99  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Nizat,

On Sat, 07 Nov 2026 21:00:50 +0100, Nizat Mikayilli wrote:
> Add the SM8550 MDSS compatible to the clients list, as it also needs an
> identity domain at boot. Otherwise the scanout of the bootloader's
> splash screen causes unhandled context faults and the screen goes
> black.

Same on a OnePlus 11 (SM8550), booted from the bootloader's splash on
next-20261120: without this patch there are ten unhandled context faults
from the MDSS stream (SID 0x1c00) at addresses inside the splash buffer
before msm takes over; with it there are none, and the panel comes up
normally.

Tested-by: Majid Hajiheidari <majidhhdri@gmail.com> # OnePlus 11

Thanks,
Majid

