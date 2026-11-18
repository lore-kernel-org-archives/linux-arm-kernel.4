Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD3606A33F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pyrXN/zi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y33l58Nd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=; b=pyrXN/zihZ/wIq
	j3+YjfdYq4zTFWr0JcPZQ+rfnNwAiBU9Z/29nBOYGBJsv4MpyRarggmnXzzVgL36+5KYsGjRHsbdF
	pVZlXSyD2nyStP+8Tj/yr2JBTQS05P844cHWajBgn7ae7rAiPZ/hMnBXv+oeHXngXW7FseOFicE3m
	ulvVwfNlTprPqSgl8+L4pFRvGFmpCAGrQY3P5wQkHIq6P9AWBsKlzJAA7bZFOMEOurzMmeLCx73wv
	tSNO6A17l4hY4T9huCoKsX5qVHsCGznrSNLhBRP3szvKNYTC5itoJRzOYwgjy1BA1rZfI6FPDF02/
	OyMxrAwnyLwzryGfAmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdzN-00000008jk3-2Z6p;
	Wed, 18 Nov 2026 11:38:09 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdzJ-00000008jjS-14bD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 11:38:08 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3b3a5c9130bso526645a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 03:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001884; x=1795606684; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=Y33l58Nd1oOU/jfJ4ltSjDpaz/+12aEvIdQAa7w/9YabXylMELjIUuUGEDnP+Rp6K/
         Z2tkf4Y66cftc0df/2RN2CtMoRjdiVdgsEHdgRP8gC20ercnstK55D9Fv7hP/IMHT2DO
         ahVW4vX7zCU7KOwAatCUpdQGSRq9FaYZe/3rW5J5U2QrGrDLuk3zGwUttb0fBkQqDC4d
         eLZPq3yo5liO337fYLL4ycuFcSZV0JYJ4f1Rrq2sB2vyspsOpollwbVEz3rDx6/PQHNL
         LGzvjmqOxECat1LGbSxTSYgM5Ytlrcj5GlCNP5/LfDvSbUD1Erhk4HOJxqOCmv7mwXXM
         KReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001884; x=1795606684;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ7qkD0L75OuzyZ7+z/b4gyTaud+oMoBaIWST7AAwg8=;
        b=ztJ/mkfz9Yq3ZtBrwtPuYpEWxWS7nMS37H2q7TRbhnk6zVF6AIlWJLc8hDztnPVBjm
         eSq+Epw2GcEnj3cybVDrkP17Qg6TlPygGSVUkuDvYBUQx9gamoPduAexmO8HLNuHb7Xw
         AyAMA5zEcD49vHHdcQYPgigwwqf14NmnU8AkGzCbkwxwPuyHHw/90lq999JbJcEu1/SV
         0mRrCfrmMGe+QHJVZ8KzOQFQuK6XkcOD/xP9nP9R8R1QF58h4ltPfjjTIpPyv99ZAXJO
         ITzr9aJoT1hPWYZJOAVWz8t8149lFThEEJWxfLI3EQnlnC9oj+iGkkn6qvO246IixmOs
         wRrg==
X-Forwarded-Encrypted: i=1; AL+hErE9wTNekV08ujnphy0CKvfbfjQicysOTeH7zJ8yaIItBmaL6GZEWLuwOc8Ou8/Qmr6C9IV/k/RtQwhLztId0rzm@lists.infradead.org
X-Gm-Message-State: APuU4Z99+gTshLF7yPTH+poclv3QF80cTC68UzNai2xoxkIvb1guzk65
	EtwfuxNEgzu0fTG+O8OSrcl/mg8uXXJB+DUQu6mAim1gjXOVIK2E1m50
X-Gm-Gg: AZFdTZeHwV3F+V18itIWbvDSfHMgVvIdzktm4djPK8IX/IVwQ0ayA3ZGlP0UT4xjJKs
	3Lscv6q8qSPEiyOMF3AUxEB/TIsxTtXOXZimC69BjhLPs/wCszcCoPITy1BzBHT+/3LWJIGrSI4
	8Q7Y+6o9QBWqdORkwQUq+thL7j17TqwYBiyJRLQFYNtm8c5UiILcnnuHUQZiZC9INox93vouuGB
	WJMaTPlIVu2AJ/RVDFnW87UsAqQ7S+9tGr/iwL4HatJF+w/rTEz7qYhLwNBASXQNQgWpXbmzwPy
	qP273qXfEID/8xHKhoBfW0luND+/7XLnmdetV2eQzWwYP1U46NqGdjgIv6gvsHi4pr+ZOhiDyxK
	dqcwJKOs1asNGytwNk5fGMJX8xMRLy5YnWsVzYrFJ0M/kGf3ENYbcBbuzQrf+/zrZsQydNxylJ0
	0CfFYFGbPPm+Ncd+RqUvBoivPaSZTWbS0/RXynWjV+t0IIBW1Ow0HoXEerJLhSvxcEEtAJM7Vld
	TIeFn/v/fJrc4sRz+ozi0l9f5BB7JFy7ZuS7bFQIbWdPwZP930MfNLXeulw/lnQb+LQxJ0YAlNd
	t5AxXTBmUE6MAk3Z646bs8nxk8AC8oAfHJ72CgS5B3TXz2CFQ4DBmLQ2mRofG5qEQMuvK0NDm/Q
	KGpczElYEVrY=
X-Received: by 2002:a17:90b:5407:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b3d074d841mr2303560a91.15.1795001884103;
        Wed, 18 Nov 2026 03:38:04 -0800 (PST)
Received: from 1.tailnet.ftu ([1.54.0.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac254ba6sm8950084a91.4.2026.11.18.03.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:38:03 -0800 (PST)
From: =?UTF-8?q?Tr=E1=BA=A7n=20Trung=20Nh=C3=A2n?= <nhan.094.vn@gmail.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: exynos: Add initial support for Samsung Galaxy Note8
Date: Wed, 18 Nov 2026 18:37:19 +0700
Message-ID: <20261118113756.304373-1-nhan.094.vn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
References: <20261118-upstream-greatlte-dts-v2-0-bc2f23ce81c6@gmail.com> <20261118-upstream-greatlte-dts-v2-2-bc2f23ce81c6@gmail.com> <CADrjBPph5r0rjZPLz7db9-QtmN5+7S2Ft8Zgn1oi+C0Okvas_w@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_033805_302555_500AE529 
X-CRM114-Status: GOOD (  18.17  )
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

Hi Peter,

On Wed, 18 Nov 2026 at 10:51, Peter Griffin <peter.griffin@linaro.org> wrote:
> Does the Samsung bootloader not pass a correctly populated memory node
> for the device? Or is this required because UniLoader doesn't pass
> along the memory node it received from the previous stage bootloader?

From what I can check here, it's a bit of both. S-Boot doesn't build
the memory node itself. It loads the DTB from the boot image it boots
(BOOT, or RECOVERY as in my test); it checks that a /memory node
exists, and only fills in the bank at 0x900000000
(reg = <0x9 0x0 0x80000000>) when it detects 6GB of DRAM. The other
three banks have to be in the DTB already. Samsung's own device tree
for this phone lists them and leaves the size of the fourth bank as 0
for S-Boot to fill in. From
arch/arm64/boot/dts/exynos/exynos8895-greatlte_common.dtsi in
Samsung's kernel source release for the Note8 (SM-N950F_PP_Opensource,
N950FXXSGDUG6, on opensource.samsung.com):

	memory@80000000 {
		device_type = "memory";
		reg = <0x0 0x80000000 0x3C800000>;
	};

	memory@C0000000 {
		device_type = "memory";
		reg = <0x0 0xC0000000 0x40000000>;
	};

	memory@880000000 {
		device_type = "memory";
		reg = <0x00000008 0x80000000 0x80000000>;
	};

	memory@900000000 {
		device_type = "memory";
		reg = <0x00000009 0x00000000 0x0>;
	};

The DTB in the stock SM-N950N BOOT image (N950NKSU5DZE2) has the same
four nodes.

S-Boot does the same on SM-N950F: the device tree fixups in its
N950FXXSGDUG6 bootloader are the same code as in the SM-N950N
N950NKSU5DZE2 one. Every Exynos Note8 ships with 6GB of RAM, so the
fourth bank is always filled in and the DTS doesn't need to differ
between them.

uniLoader then doesn't pass that DTB on. It boots the kernel with the
DTB linked into it and only adds the initrd properties to /chosen, so
nothing S-Boot wrote reaches the kernel and the memory node has to be in
the DTS. dreamlte and starlte do the same for the same reason.

btw, the name's Nhân; Trần is the family name, and if the convention is
to write first name first, I'd be pleased to adjust!

Thanks,
Nhân

