Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 04:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RPN0j3/K;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ZkvXRGQy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lGriT5mvGmwLjZVhyWJORLnWv5py1JwCn14OrwKl/ns=; b=RPN0j3/Ku0s5GCj+er6PPBOM+Z
	MJ0m44GPsliwUxRc27ht/AOQei30VYtdgChcYAbP7dpTxF7Vm9adXwYa5W2KFm2xp0nF5GJPaznBz
	GhbLEUt93S9MnoVuVGlOQ+eWSykBmIrCmv2D9GIn2odJF4VysSbaMGrQYVwaJYBBHzB/sdyLhPEs4
	vduwMSrVHGAobVqPKAd22efO7+HkDPm4Tlfu1X3GcMgs2woiLzJn9ZOfmVAXqlAW0Guw1VSHJul72
	ScINKzHipKT39wMxxQdchNc131m25BUiy/QncncMg0WQSxvSfcZ4h9RZonNIY13xcLP9zE465vO6Z
	r4XuLdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXDk-00000007hY8-1Ul9;
	Wed, 18 Nov 2026 04:24:32 +0000
Received: from omta036.useast.a.cloudfilter.net ([44.202.169.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTXDi-00000007hXB-31XT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 04:24:31 +0000
Received: from eig-obgw-5002b.ext.cloudfilter.net ([10.0.29.226])
	by cmsmtp with ESMTPS
	id TUDCxVyCo4vCDTXDhxSfaW; Wed, 18 Nov 2026 04:24:29 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id TXDgxKPCQb2qJTXDgx20qF; Wed, 18 Nov 2026 04:24:29 +0000
X-Authority-Analysis: v=2.4 cv=A7tsP7WG c=1 sm=1 tr=0 ts=6afd287d
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=Byx-y9mGAAAA:8
 a=bFsclcQv4yI7B98-yzEA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lGriT5mvGmwLjZVhyWJORLnWv5py1JwCn14OrwKl/ns=; b=ZkvXRGQyU0Wzkfafy1hMVHyBGu
	HCriZteRWNHQit/5wA01C7TLyBVGK2iOveswT90ziJ2AfriLIUXMGCGTwlBnNsaDRorcqjItIFQW2
	a5bmgGt2lfTj8ShHcmxjmPi6evkb1+wyslBtAyZEk7c1QrNUrWNevqcaRuBXNIwm43smI3xYCmW8Z
	fqvhqEh5dErJ3qO0uE8lJwRrY8DBn5PE3iccQmtedd4ed1oZE9kdXzFqLeIv4oL1WFfGND1L78JYO
	JsVK1CyKrTuaGoBH5u1XsVo+3kl0mtVGaFn0+8Lk3rVxRYylcXvn3tw8fgwi8N5sE4Dg5tM3lW/xN
	SpglVpHw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42556 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xTXDg-00000004C8t-0Nnp;
	Wed, 18 Nov 2026 09:54:28 +0530
Date: Tue, 17 Nov 2026 20:24:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Yang Siyuan <hsyysy@163.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] watchdog: sunxi_wdt: stop the watchdog across system
 suspend
Message-ID: <164e54ff-8a1f-4841-92eb-7fe1b7815a64@roeck-us.net>
References: <ece4aa08-fb86-4f76-b4b8-a9351a71df14@roeck-us.net>
 <20261118005048.385059-1-hsyysy@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261118005048.385059-1-hsyysy@163.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xTXDg-00000004C8t-0Nnp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42556
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFY23prWjnBEgFl/7PiuOgkt8eJDnm6+DT4ItZyHECMPAsqtK3kvjkJnJ1S3iMvlPXJPdIWL4AfBdQ4gR1g8/VOXJzvod0ic+emjaBI1808XbvjCobOY
 CIy1oFNiSDJ7w/+lPZ/WJVFv4bS/dAewuAj0aYhH2IXsVLCWZzP/tp+YwRRAZ6dZCvHrNFV0ig/DdWTZbJbAqlw0+O0vXFCAiK673lMfU+WzC2xDYqJJb8jf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_202430_870934_7E911FE3 
X-CRM114-Status: GOOD (  12.06  )
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 08:50:48AM +0800, Yang Siyuan wrote:
> The H616 watchdog has a maximum timeout of 16 seconds.  systemd keeps
> /dev/watchdog0 open with RuntimeWatchdogSec=16s, but during system
> suspend all userspace is frozen and the watchdog core does not stop the
> hardware.  A suspend longer than the timeout therefore resets the board
> before it can resume.
> 
> Add system sleep PM ops to stop the watchdog before suspend and restart
> it after resume if it was running.  The driver did not store its private
> data in the platform device, so add platform_set_drvdata() for the PM
> callbacks.
> 
> Use DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr(), and use
> watchdog_hw_running() instead of a private flag to decide whether the
> hardware needs to be stopped and restarted.
> 
> Tested on an Anbernic RG35XX-SP: a 30-second s2idle suspend resumes
> without the 16-second watchdog reset, and /dev/watchdog0 keeps working
> afterwards.
> 
> Signed-off-by: Yang Siyuan <hsyysy@163.com>

Applied.

Thanks,
Guenter

