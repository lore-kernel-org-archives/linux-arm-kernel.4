Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D335C606A895
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=korJEAIf;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HQiQN1Xl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=; b=korJEAIfVbIGZJ
	ynyVTRDQ/h2B/lb1LBxY4KYT4PHsgbawZqgmwqIke5GUu7JpfuZG/HCHEPUmIz3IHn5VrzokvwaaX
	GOINSRIYgBGE2SBs/CIUja9paY66LuYyrYM4+o/9SB3RzaWpw/UuaZAcgWMmqgAA1xppWZCcShZvR
	yI2bUXyYQLgq4YGPn0eKT52vdVNROzzGg48Xc5+GPhIVWg6LTyIaXHCvSk741goC1B0q5Gzc/jCo0
	x3+7T3N58Rz6HLsVQmvT/RCpcC9LV9/E1wPDxly+OSyVrrqiKVJTWKVhpMJUnKrTrcUolkYHAe8FQ
	BfVQIpHbhyU54cNvBKpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4PU-0000000FFV9-0PSl;
	Sat, 14 Nov 2026 03:26:36 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4PR-0000000FFTT-269g
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:26:34 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so690077a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626793; x=1795231593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
        b=p36BKi3nv/rA+shj742jPv4U0b780J8JX/1nh5qOEuklKjsA5SUlcvDG0jKsM2fS6k
         +TxSamAkkciU6zuoGCdk8060Gkwu8cqdb3/2r4/UDtS/40hypTjuVzYK2VZY/WoIoeEd
         4AmCwcTBAex/HLnzrHbtxITCA/XJb7UtyHD0SpKTvPOiH70Ssmf7cYXDz3RrFWjPl4Kk
         Wlzr0o8n+/g06MPBvrdJZUQKj/QYq+w/aTgTLnjH5s6orZZ82i9FVq3zylawiYE2NLQg
         TwSmjldbZcFsOfzR49OCCydas814x9hWhhlG07ZRIvwL0QVwc5d0gEzcZnJG26/jtovF
         v6nA==
X-Forwarded-Encrypted: i=1; AL+hErFEbKEpcscmsF/hD5lYaadLRPH/JyOCCWPIPO2u0C3kc37xdCIKfspap7FdqhJVfU7ctHQ6F++dYodbpjy66SpK@lists.infradead.org
X-Gm-Message-State: APuU4Z+SdhoN8RGiUQzhcNZzE7SRLUOwB9jaIsS18Q8fhih/xZKjkAX7
	ytIsPHL6tMI9vLDcTSOBLR7Pk+MVC4QqwcSp/leGm8JQNzS0f252VBWjY/aEX/z4/G6bgJBUt0K
	7e6Fs5OWUutuyiwCAGhk9UWnFktLZWHmLlgCy14ALKurLA5SwsgOi4dXTJIswmxdgpEBPy0VZjl
	zJ72p9VSrGI0E/FShgM0CLMVmlfua3v1Uacp4PHd85OE+81n1wPrWMyF+LLlFJO/+CXhv9naJ4h
	ur1E3Ofo0JNrH5rOLEh41/i5PZW48p4360=
X-Gm-Gg: AYBFou0NaVS5BjNj57KrdhzMBk3+akn1ES/m0P112fVTO7kJQ7AnihZwCfaqn2z5oln
	oODib8LY28auYWotjk6mejKDCnttvPtXUr3XqZcEglFiXCculfbV8oVJvpwrayCbNbKMce4i/7q
	mylegA83KhR3MKK/vLkenRJixWRtLK7H5qhvyJpcC8qpxDDx3sll2zps1TATyG19ecd+1bG1+Cq
	uYtWAgx74ozfdqwu5mJ4KS2ytOanwf205Ewy56BaoPioisJg8p43yOVM14YkT/V41WFpT352tkY
	vBumLhA5JXiyZdhqoTJitxBjk2sYkFccvMYZ9l7E3eABPGJWKfiVEV8B2EShHam+xk/JzNYg/de
	b0TOONMuMajyYRfNDlqNP1pJ+bWx/4DSLVNKtBXSg0U0R9wvubhOWDssvZzRFd6rjJU3RED8vri
	yNU4R5W7ybKIRS2ip5OeEWjobyHSwXIcduhMYJOcIJ
X-Received: by 2002:a17:90b:57c7:b0:3ac:9d26:5532 with SMTP id 98e67ed59e1d1-3b1b07fec19mr4496612a91.3.1794626792821;
        Fri, 13 Nov 2026 19:26:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b197c1a3e7sm8892476a91.2.2026.11.13.19.26.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:26:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2070597eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626790; x=1795231590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSuog9nQWHn9MLxIB2S1PpZmy8uazH4JRtiBCErcRLY=;
        b=HQiQN1XlWYLgjRBTP27MkQIcvqfBLbCBF7kdcJyRwFb1p1CDfzVrZRT91b55nj96Oo
         WNm9+mmDcUbuRafn6hlDM/w4dInJsao74YKCPM6naOkj/tCkRo7aaCK6c+E/5kbbSopl
         lvBfQB/ImfZsIsmladfTJ4qu8l5xLj+M6GEVQ=
X-Forwarded-Encrypted: i=1; AL+hErHRA3YRQAtmWjCLs11+16sQm/HtS7iUSgN9XniDgyIaibrXcezrzYpvDZPsz9hnFDQzkTpG9IKIeOcPEBgXqWGX@lists.infradead.org
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626550eec.21.1794626789959;
        Fri, 13 Nov 2026 19:26:29 -0800 (PST)
X-Received: by 2002:a05:7300:8818:b0:36c:a390:8907 with SMTP id 5a478bee46e88-3796750684emr4626503eec.21.1794626789258;
        Fri, 13 Nov 2026 19:26:29 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379558231eesm11403804eec.12.2026.11.13.19.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:26:28 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Martin Wetterwald <martin@wetterwald.eu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v5 09/11] platform/raspberrypi: vchiq-mmal: Support ISP parameters and stats
Date: Fri, 13 Nov 2026 19:26:27 -0800
Message-ID: <20261114032627.873858-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
References: <20261112-b4-vc-sm-cma-v5-0-d25e3b687e71@ideasonboard.com> <20261112-b4-vc-sm-cma-v5-9-d25e3b687e71@ideasonboard.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_192633_544171_3554D50E 
X-CRM114-Status: GOOD (  10.11  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 12 Nov 2026 16:48:07 +0530, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> The ISP used on BCM2835 and derivative platforms is behind the VCHIQ
> bus, where some parameters and statistics are accessed through the MMAL
> layer.
> 
> So add the relevant structures, macros and enum values.
> 
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>
> Tested-by: Paul Elder <paul.elder@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

