Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB07606A8A9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t0Nx9Drz;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=doodrfKS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1ADXgRDEmtJTI6BRLdXJRmKIrZ9FU+mVSFJb8701l5g=; b=t0Nx9DrzVbyh9T
	EUXSYCeomZ7oYWX0ry1YLpmn9R/4TSSmICnrtAtchOTZVzsrbwlxXWkjAy3lW+VsxXJWRp3UG4QSk
	SxOZfACRLNGZ8WNy7anPRkVuLSFIyZTrNkq+nYWvtPYdIRw6GntP5QqhFrGdPKfUfivwPK1mi6H6f
	QSAyD2isbyD+K8ZhcgqXm7IdWWBDB9JFJUqR/pSyxbD90OAeXDdvBuav4KJu8xyPk64GBggr6oVQc
	cReT6c9fiVsr0HzMcaDe8qn/bg6z9RShwDxc8uqA9YkoDeXM2S8ei1dPpuZfcYUwmRuknieF6p3as
	cItaCLP4JVteWFj1OJxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Em-0000000FE0z-0clh;
	Sat, 14 Nov 2026 03:15:32 +0000
Received: from mail-ua1-x961.google.com ([2607:f8b0:4864:20::961])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS4Ei-0000000FDzh-1SKQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Nov 2026 03:15:30 +0000
Received: by mail-ua1-x961.google.com with SMTP id a1e0cc1a2514c-990fbae94f5so2273579241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:15:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794626127; x=1795230927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ADXgRDEmtJTI6BRLdXJRmKIrZ9FU+mVSFJb8701l5g=;
        b=QLSjjCUGQRosLpx5Cfe5KS64fklErgN3lby6GZ4RIEbxiILsmrFWrcaBn2TGnbAr4h
         2Zr7NCZulkssuEARb443CRZck4P+ZSHTHSiFbXzzWQN6p2q4AGJ9//SIw5j3dQUWonyI
         9+LaXi8OpCpljd0CCmCJjU354kHoKHFRXyqKFVG9dUGgpqFz2xKc4tJOaiNvb0zGvcbq
         LXqAUA1lHJ1WTEd7Bo3MXk5G1NVd5wUK2QQKbEBI8H2v2ALXVWrtlISap0z47iaBJkM0
         0lxPPIJRJSXX3DZwU/kbNlxV71XBMeqBPSVaVlb2Y/4+q8A1tfe6KIfYfrboYijfa3v4
         EyKg==
X-Forwarded-Encrypted: i=1; AL+hErGLWmCVkGaDUa2nMcLfOMr0yq5ASItxhKgqIvv7snOGx9onqfQtFNHJ/70Vlcr3d8aaB6RHknNodd/jkju3oBRP@lists.infradead.org
X-Gm-Message-State: APuU4Z+0Ex/BCJ6+mytrixjtzc5JJH4RT19g0UbuIg3y+YYcoKTxGhyF
	9CkbrBBJx+j7gxwuGDVwciHRJQ4C9s5N1D+SPaaaM0PGQakSuKz+0iD07yUAKfGZybtZazjLNqD
	ImvhKMIDldp1N5aoOCons87IA6jdrxpY3q4C5wfU8LMRPX0ptyXQQ8gSrPhGvc1T8HvRYdtI8wH
	QCY9r3qloopRCfFmt0y0zjlP66B+apy4PHhAHEtk/iY8f4A5CKNX4U1HES6+jvjJJfcGnmMcOVE
	FNISojO08Zz/e3ANA1S2Kd8xZZefnOl/SQ=
X-Gm-Gg: AYBFou1wBFP0rAhBFvOxy1d1xLCYDPv+o5s0OYfsl/KS4DkSzy5qrIl6ixYHmPausFE
	oFdU5wLQOouEBBlJG7j+21FlTBYKOor5GARgqgRzImZbSBoPOa2+2kETI9pYrYT3o7YSGLjXGD2
	Q/yNZn25DL9Cq5SSFwnGpv/wVUpiLG4dbp5IIwP5pEHcUNVHRF2nGY49KPgB8sjfgrdoYuB4K9Z
	PFcf4WW/X4aU6uV+RdehBwqrGwPollC4IwHeVyZzPZ9U/BDxgGYG7pv65Reetbx334J4b0Y8+7u
	cLoCrPVNzZ41C6VIA3xSjZGqczbxeWSZbKXKfgB5R22Ow9XcewAFVGMNxpsovrRiGOjbW2P3w9x
	++vkzM+5rZb2E7knl7CD9jTAhH+mSvyyvUny+GJ/kDLF5DoKb86mdKJmoZe5ur4hcTcBlq1CzLK
	bjQzT+kW9lEK6k+U7jl8pNUaOsA7NVVCeUB+BgQPKU
X-Received: by 2002:a05:6102:14a3:b0:7d0:6cf3:d8f3 with SMTP id ada2fe7eead31-7d64d77c0f0mr1897070137.18.1794626126941;
        Fri, 13 Nov 2026 19:15:26 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99c8d2d10desm618480241.7.2026.11.13.19.15.26
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:15:26 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so316557085a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 19:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794626125; x=1795230925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ADXgRDEmtJTI6BRLdXJRmKIrZ9FU+mVSFJb8701l5g=;
        b=doodrfKSuJeQzT3MPk3Qi2x+Dqafk244lA/VSRRLlSiF5uO4rCxMrmI22oHP1CBbXr
         JHH5To+ydW3RqZ9QJEsV5/dwX7c9TV9eQIkPTrwwOD7LPdhrFSJPAJ4uFnzFsJKE51Wr
         Zubh/R7K7epwDCl5q3og0H/Sj9j6Fzpv9C2Cg=
X-Forwarded-Encrypted: i=1; AL+hErG1ZlZUcKXm4HqTcfJBUXQQu/N+DolfMIjis79v4sqTZZFLnpVt4LGFJKYD4Dbz/lNgdQuWRUZQgYBCVsODk8d7@lists.infradead.org
X-Received: by 2002:a05:620a:454f:b0:945:fcd7:7830 with SMTP id af79cd13be357-9494bcce1e0mr715358285a.83.1794626125425;
        Fri, 13 Nov 2026 19:15:25 -0800 (PST)
X-Received: by 2002:a05:620a:454f:b0:945:fcd7:7830 with SMTP id af79cd13be357-9494bcce1e0mr715356285a.83.1794626124999;
        Fri, 13 Nov 2026 19:15:24 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm34132906d6.17.2026.11.13.19.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:15:24 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Sander Speetjens <sander.speetjens@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Eric Anholt <eric@anholt.net>,
	Stefan Wahren <wahrenst@gmx.net>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in struct rpi_firmware
Date: Fri, 13 Nov 2026 19:15:22 -0800
Message-ID: <20261114031522.871320-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com> <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_191528_385403_6D56437B 
X-CRM114-Status: GOOD (  11.59  )
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

On Sat, 07 Nov 2026 19:21:36 +0100, Sander Speetjens <sander.speetjens@gmail.com> wrote:
> The hwmon and clock platform devices were kept in global variables.
> Move them into struct rpi_firmware so each instance owns its own
> children and their lifetimes are correctly paired with the parent.
> 
> Also check the return value of platform_device_register_data() so that
> an error pointer is never stored.  The child devices are optional; do
> not propagate registration failures so the main firmware interface
> remains available.
> 
> Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/drivers/next, thanks!
--
Florian

