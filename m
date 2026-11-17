Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1401606A323
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 00:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nHCzahSn;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Hvr+f/2q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=; b=nHCzahSnMGn+Ff
	lN/rhY3t+Dp8PsgxNcxIP5E8Yx+q7Gd9hcJoZBuwLcOvQFo7Do723+xFYwJgBLUpJ8N+yXyVQ1BAW
	fyTihs/nht5XsUqOnmWczKXJVz7WlXrO76UUc4ykIYvW9RHCi7x+RhaII23B3EcxtGrslfDZCEO7T
	WljkNH+fTXaZldJ0qWbm1BUZO8vMnr17PI/eCiCHSCiCD84PxanXmXMsbh867lz7Dnkxc3Pm1GTp2
	fVUUz8mwWx3SKFq9fliMITtqWI+mtsG4oe5/iVt+qZmIJgg9g/r1c0RERM3/z0CtNHrHS8ly2UxVH
	NboxIiZhKuTd6qswh14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7Gc-00000004GCy-3BnI;
	Tue, 17 Nov 2026 00:41:46 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT7GZ-00000004GCa-3BFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 00:41:45 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2e977109392so24101735ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 16:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794876102; x=1795480902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=Hvr+f/2qBlQFFsiNvoPGNuc3aZBiK/4v2tEydvwfaVBwqHvw8jGSuizxkKpz1xXXaL
         7NcXtH4rRWwdphpqkUpaQ/EJ+FJfTgxCV0eD/cL09HjkFHZwNqLV1hbcappbpCEhARLP
         qcn3gmTRZPIAN3bFIFFuvlMBeaT7MepNC65jt6TEjT9IsUrKIX2nry88umkXHiBX0CDo
         fxp1U3lSGvopakimlMh31xZeOONV88RLj8CrUzDw5ewHFR+geLM/uf/A8lUh0Tx4heIQ
         mIIgVzwXktihfM+VVKbnzYT1DmDE4xgAPy8t9qtQCXCz6uIUtYsxJocsNJBp0OUzKJTz
         ohoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794876102; x=1795480902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JJxaAqU/N4mLE/X/C5f40TDVe8Y+8SNJEnAV6SKgDMo=;
        b=Ft3wjD5AdJBgFNrrH7z+i27wex1DANXSe1p10u4tVzxiSj8hWJgmzAfk6Pf/ztCcwr
         Z5QJGxK6uGozBBwuwlrP91MBHUkse9Yv4zLk3qvDXlUgaCETF2Z7bxFTdtNbjtvT1zVg
         QY+AMpa/yoG4abMmcVkRxO7OhtRgIVT10GgIJoQLpeeUbnfM3PnqjICEjNt6/WpFy/xM
         Xfz+Cqc+6jRIGBFV6cG1en/c8IMNuSDE2cDifCBHCr5KVA234d0bUd4iOCeqtqD6apZz
         Dqx1QldXYc2/QZAy+WZypusbY1LgRO6Bmhwnq0txaebkZYbxoYG4hfequaXrt8r3HHBG
         WhQQ==
X-Forwarded-Encrypted: i=1; AL+hErG+BzxfndTYDC1ix5FOnYvbEqd21KhNuU8kRCq2gXMRmbg1VXM5SKmUUiMrwzbv/UEvkMWSgpLJlApsokJuuTIO@lists.infradead.org
X-Gm-Message-State: APuU4Z+9SPb6IFe9yDsyBOburkd5en+ZG3W9KmuZEDP4ez0dPvEtU/iu
	s4kOXmRDMUAP5GFTjz4pyqnpBY6qT6JJXX1lC9m9aFLpBQi1XLZG9SiNwiGUxKQukw==
X-Gm-Gg: AZFdTZdz5ocLYjFxKFuusq6neKPFbVuxjd6Qp9j3CFWBIjMZXX7DUPHFsoDWVdJ3QSR
	NcB4cXd4kOAKYUOa4uxphouoJ9eoxuvcAzzJFHQScD/0Wmc9WBJgsNj9JeO01fnI2xFIIHxkMcp
	rF0ua+XOIzPZPX5PtA6iQ2/JrXwFairSUEyKtF7n/3Cbv/bXUCdfW9nFerBRKJBH8aTPJ3PKsGJ
	aSE/LVHInik8OnX0Ga2hRJ4bumuINJZsgjHhHDDgq/FuO4eDeWQazdPrChkv+EWestZk+hmwuw6
	e1iohoMVICkHxjYXuzm1toJeEmkvdKCWY9Sj1ev/9q5hrWAjpan2/FSiPr9T3tmugIW41G/8ruZ
	lNkstqvGWYmLQCEDzoQfHHUgc2gRCBoBFpHi+1r8joOUWR8FLu5oI9PSiTwnnLNy71VAcj1HMp5
	JOjT0oXIeYrAFToJxVKE0qFsfDWx0DIrss4o9O/ru69tDMSpAoDqu+uI7ouiIY3JhThYZpc5T6w
	kn1nOB4bE91dbfbO0eF0EDW/rpibziFw5h9MfZiyhIi42LdXvRCbKq88gQrGn8h2bWTG8Srgu+E
	yWq7UIYFKRUm40pn79ikwUr4dDHJh7AUAHcgOfXUPzeI9kW462uoN4o39V3+s5po+7t822HVgZY
	ZbiZA/HmqaiOrxAX/jQ==
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr134037395ad.24.1794876101909;
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd76d8f08sm5594825ad.4.2026.11.16.16.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:41:41 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	s-vadapalli@ti.com,
	rogerq@kernel.org,
	bigeasy@linutronix.de,
	martin.kaistra@linutronix.de,
	vadim.fedorenko@linux.dev,
	r-sharma3@ti.com,
	robertcnelson@gmail.com,
	nm@ti.com,
	vigneshr@ti.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE
Date: Tue, 17 Nov 2026 07:41:33 +0700
Message-ID: <20261117004133.1594972-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179446830443.2199510.10552580927894870264@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com> <179446830443.2199510.10552580927894870264@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_164143_945618_7EFA1F2C 
X-CRM114-Status: GOOD (  16.58  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> [Severity: Medium]
> Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
>
> The register belongs to the SoC-wide GTC, not to the CPTS.
> am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> request. The previous value is never saved or restored, on success or on
> error.
[ ... ]
> Suppose one of those consumers expects a different exported bit.

There is no other user in the tree currently. If in the future something
else in the kernel wants to use it, then the solution would be a small
driver to mediate this. If there is a user outside the kernel, I am not
sure what you would have me do about it.

> [Severity: Medium]
> Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> AM65_CPTS_GTC_PUSH_BIT?

I agree this would be an improvement and I will do this in v2.

> [Severity: Medium]
> Should a failed syscon lookup be fatal here? A bad index just below only
> logs an error and leaves the feature disabled.

A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
device tree, so failing the probe is right, and it lets -EPROBE_DEFER
through.

[ ... ]
> With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> DT with ti,gtc-push would then stop Ethernet from probing.

MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

James

