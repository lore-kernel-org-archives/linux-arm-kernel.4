Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E383606A889
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ci/WTtup;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S17o6Tvx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=; b=ci/WTtup4KicM/Su/Hxbmdze8m
	PnJ761HtQJ6TSHbgv6cAEjnhRTkTKU3YrdxjAJTBp4uUwtnt5qstOmpL5O2ng2r9nWXp0d+xCfsvR
	U73z1AAKS/RV/um9JVnglPalG2f4nngZwIhtTeOsgHYtnAZiAmhSq7UuyvxuxZViyjLyxmRXmlDSn
	Co+8EEzcBJ9N1GHYQnRMvn2MWoUZIQ0YEfvU9Ew0x8fXEXk0Rxud2BESb2uJi+DNjvZyzXMz01T53
	XqoqVEY86az0MYDNaYsNQwqnbnY3MXEVcx8SIWZ8UmOQDHyrVALI5soHadYmGAQdyRoEHVVk9P5OA
	Xoi9rXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmuE-0000000C7qh-42xI;
	Fri, 13 Nov 2026 08:45:14 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmty-0000000C7iy-1PpC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:44:55 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3acde6b7b29so1081581fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:44:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559490; cv=none;
        d=google.com; s=arc-20260327;
        b=AHPUhamGK8sjIPnFYLaOiziQk3Io5oGPD3zFZVf4h5mOlhuTjFFDIgIGVDYNtsucc3
         oXEFcAoh/1ksYHghSSYyZHILAZRF6qmCnvODH5zZisHEvOcKzehdb1u6W4hmoJNSj9WF
         s1CCtXq/8k7u/ZZZ6BX4i9FsXo1jwyrVaizbwWqonqbLKunX3qe2OqYDNP75aLIhXZdO
         3VyRKZcQdDnnOt89ZcQred0b0usbxuvre3cMaKki8yQbfOMOp3GGMpHAsGyGbY1GpM8R
         DZGIhoSqkn3TEPkihf8l3YxA4RUPO7cCZ/dRcXxPQGA2RJ9f/prPBmdDDhbsQdode1rv
         EfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        fh=KeZfTRZnM0n6C09+NaunO6qmuBj9Ml7TXUCuWaNqWPA=;
        b=qb/hYpnoR/035qclO6YoOg3BlnTWWBligApHrCvR3ah9zzypyLVmU/gzGIenUDUccg
         7KLDtLZ84Fr6fYomLC6BSw1+E+XzI67jK6quZzQq5CQ4CULLEFv7RJUhjvOSJGOYjVst
         20QzrcEj90vrj23xbWjj95euTxXJjXpL/R9R2CRiASThQxGMXtyupzvw5LUTvPoRjb/K
         3gMPB15I0c8axJvd9HbeHFO7NJ0ohLyLdziJgfrGu7a0G9FXPu8GANGs+v3D1waXNZgy
         B5doLlXK+36ZcreTdx4A2i89g65ZBnO4Wt2FNUA5jgSAwkqpuXOyUiXjCqBDrikz1fTC
         /zTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559490; x=1795164290; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        b=S17o6TvxfOO+60dDgrcDGeAJ/2zOZFTTd94FCsv6dQPTHy9/d4FVOvPa1NIMdEt+sR
         nPZJjzScywRuIN/rpu0pSVYZdY6LfOMMI7edHwaAF9pBwTcxmUWjz3EdcFNwmMUXvEsR
         RfsDFZb5qCKYpZHkl6vgNtzFph9tgw6HRRad7GyG3Tzjk6xsoMhjkKg9UuL8MabaKuak
         fV8DIIkDzdx3RCu8xpkrLNkZOah5ivRPojS16r0ZcX67qyQ7OK7cMwzVaK74M/HUsfSc
         mfGnFSxdtWPbiwzTsn0mKI6s9ofHcPtXkk98LDMLjZbE/zean5/AVAd8ovZAr6XJOV86
         exQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559490; x=1795164290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        b=xObFPlclw0dQJb8H7+EkE0ybQiUwaYHVwIKhOyT7f3tk3pzKSelYFEBpMO149ybBJw
         YjP+JvNGc/4U/FmKf8mmB0glT7mJubueI54NTyYEzk9nVFr3rV6sCEyPTNMpA0YR4Bz+
         8TfNzQAq/auDaqz3+AGQTXfj87WjxcC9nNCiIChXEZluITNZq2vGzq9x6kS4L3Jvvrqb
         iK1XcvJ8F4p4I3LiUGepZm9a9lHU/SHNHSEuMspY6s4UDySaBs98AmB9azPlKEtZ28MA
         6UMs2uKERIJlfN3qJobwAL+AtC/BFF7iFBOSN/rVm6WLLjMBOIGcVsLSgvIXXruyNQx4
         PIzg==
X-Forwarded-Encrypted: i=1; AL+hErEOCwSXUj2LO1zB9kd7jJ3eWxcuuk21k/VAGV8eY1J84PhHlj6oCTEaBOORRA3YGQAPXPPQMedLXUHsp0C62aEM@lists.infradead.org
X-Gm-Message-State: APuU4Z/qTbWuMuR12rjO9PcmaB47DkIyvvCwm1Q3ryASqstDhIeWlpT6
	wHSsihJliKQq8EwGoO7OCOFDNe26oK6bpZE7XCSAF4AEegKCrEsKuwayCWaanrWA4rrlOIk9ZXz
	lk/kMXvNCy9HH3pcZZv84Q0yP+lJG5pU=
X-Gm-Gg: AYBFou2551LXrBpPMcP7UU/NoU45YqttxQdaJkcRmZBQ3upLC7KUCjpPgjlsPVeuF1m
	knGtH+jyVK4/U3duT5VJE7MXAZ8qklP+ONr8e/Gu38BoSYZoZxHj8Wp/9/To0fG53WwvXXVrNFA
	BKyNAuYzyrmwC9PYsUgG6XSgUTKH+Vqt1IcbxyWust546USXzTDB637YLTE332YXGUUnm6nFcqA
	AbnUUfWa4ebcRJxJa/H5NHA1kEg5OwSa1gpsNLaY4pk8zJle/1HDRg+tQaJxkCRWAmfUHzQX9qj
	FKW+EcQ0yT6b9KWlugpkOB3GwSmn5/IjkSeX7x8v6Os/Dz4aNAGS6eCeQsDwMOD6mG5TnaoR6in
	n9F4mtlIVOk+3m4e12eN8SgQpZ0AAT38/kSqea3ZkLgRIkY2IrxAWQsg/bmB+/Wcu68Lf3e+7EL
	Fs1IZGauRM73jV2ZFu
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr873253e87.0.1794559490194; Fri, 13 Nov 2026
 00:44:50 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <10924894.NyiUUSuA9g@diego> <ea8fa04c-4a8c-4c55-b4fa-f37d74267e93@rock-chips.com>
 <9_7qTfdNSViwtNUGq9D13w@sntech.de> <avU2I_QzCiBPVTDC@venus>
In-Reply-To: <avU2I_QzCiBPVTDC@venus>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:44:38 -0800
X-Gm-Features: AclHuK8fX0XCl2Od3Qw3inFMre3WawrBORUXKfjsC28PcE94ozVVaEPRCoHPifo
Message-ID: <CAEy9hNX8fmEZsy-RfTDQz8Th-H8Z+o5tQN4WseiK_+RpZkbTNg@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
	"finley.xiao" <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_004454_403204_A8596DB0 
X-CRM114-Status: UNSURE (   8.27  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> And yes, I think the other smmu should also use the same handling.

I'll send a series that enables mmu600_php with its clock; it is tested
on an Orange Pi 5.

> @Arun care to also add a runtime-pm patch? :-)

As Sebastian wrote, Pranjal's v11 adds it. I've tested its system sleep
ops on mmu600_php (not runtime PM) and sent a Tested-by there.

Arun

