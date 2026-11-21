Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A9D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f2yOgkOB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=eo9Y7JmC;
	dkim=fail reason="signature verification failed" header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=xo9xremy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=; b=f2yOgkOBNV+EirQGZ2TZCF740D
	dhg/HeI9rAfcW5IM1NoLhQ8JNQybwetKm9fY8vgfozz6GgE7qRNiAQyDY2eBltB91i2+kNQldDZev
	N9WXDLCKdUVwrRKRq09KMZ0MZdPVq9plKXbV/eh4NBMAlZYLR4PhRjCtmrsFvsjPHFJKXlWtTzkaN
	thD3r2OqU4ffIVc52kKtyyD9xYLwjOthsaulUh3lK/St38rNGv7IotXeZGXnvolBlx9xen9nKhjcm
	VZcBgNH8T1gGqHYIedYilAKIP07uYWy7aTZ1oj9EDXS6upLU7Y1kz8Mgb7LKsEkLFcTPYnNXR3Bca
	sAH2YirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgz5-0000000GyKm-38Cd;
	Sat, 21 Nov 2026 09:02:11 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgyx-0000000GyI3-2zNd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 09:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795251712; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LRF3RLiNqT2WXPLbtovvo2Y3W0LAZ6vo6IYPQ5oCZbWdKy5o6j1yB8fkqg5zCDdKXs
    E3TNKUZ7z+ZYG1lt5IQ0ibb7so805phOt0UVtpRdslWtTBlliV4gPVmti/ZTQwhshShD
    uCjJhtO1RUZBrs5uD7IoqzgkgFUbi/GgRMEDKtHPsDdPfkoDYMK86r1nmygkX/KARzsW
    HWZr02GGKiS2LCoX+bAFSri7S+RNoBFdhXn/yV5UsU7zvrByNVQxr9PBr/t9LQgVCJq+
    30pRsdy2WUcIZ/0NLNm8Cu3003aI2brMejKMfs9REbsL5Aa8xfLLUGUT8eQyt8jegTTD
    D/8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251712;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
    b=fxpDRLsngyBzj0HkJ0mYW7e6o8rxWpKSwacKeKVdLB0uvWsxZzidjGpGslOyjIriyk
    mH7kqxNuVxWOfK9kPf9PtK7wSudnRHBomvGAQYEYoqaryPW9JbQmKkLJ1I3CLDX1FB42
    bozctZVK1oV3MY11Q7Hjot+S9hqmdC++SsBu3LozxklMlYU7fN/Y1Fqv6afga332PyDN
    x69PjPgS08vnhh63YLniF77SGWR50w/+Kx7+gtHIchFTDpIMyobCvmJEQ6gjxBVtMDTv
    abTTCGbZRa7+i4BFON4umin9DdyTCmetTcAPyL03REQNKin8HvAJg+ojY6o4JOuYuZnF
    uY3w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795251712;
    s=strato-dkim-0002; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
    b=eo9Y7JmCzWLxt0DfpEzsvdHnzR+kaGKRJFoahgRoydSko8tFpxPrk0HM4CEMd4oVco
    7N9hQz84ffxUUTNsMA4+iw1Axk4f4lACUei1w/LdcA5w7DDR9Q05ScryDNQ6ZLSczAeF
    PxzvWS4xpLNqEhhcyIE3WXFI6WRO4o7p/UXIfERkCtgq4LZ9y3wGlrOVEO8VWAvYwBH9
    fWTVqu4w1CeCD/WV5olez9Pp3Jx9G59bs/eXpvIwo0jxmOXlkePtmI5DdGJwvCdxwU8s
    FRf1mC2HoTuOm+I0Blc/sOnZpTZLirZyE8dgjgwVvELLVD/0upmBBjcPhwSnl58kGXwX
    dG2A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795251712;
    s=strato-dkim-0003; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=VGhk0eu+tXMD+asf0/nI/BtBPlGALoxWk6usb0EuYYQ=;
    b=xo9xremyOyhhkTvD+mbjPcZWXaqBZqFIGGWkNJAH8b9MLjfeWLYxlElRZXJQd0ovOd
    xXMoK9Is8VWQ1BMidfCw==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL91pVCA
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 10:01:51 +0100 (CET)
From: Henri Ommer <henri@ommer.net>
To: krzk+dt@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri@ommer.net>
Subject: [PATCH v2 0/2] Add Samsung Galaxy A20e support
Date: Sat, 21 Nov 2026 10:01:44 +0100
Message-ID: <20261121090146.39170-1-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_010203_917231_BC1911A0 
X-CRM114-Status: GOOD (  11.84  )
X-Spam-Score: -1.4 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi everyone,

This patch series adds a device tree and a dt-binding for the Samsung Galaxy A20e.

I verified the device boots into a LightDM login.
The device tree was tested with the device tree style checker script, which resulted in no warnings.

Signed-off-by: Henri Ommer <henri@ommer.net>

Henri Ommer (2):
  dt-bindings: arm: samsung: samsung-boards: Add Samsung a20e
  arm64: exynos: Add support for Samsung Galaxy A20e

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos7885-a20e.dts | 123 ++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-a20e.dts

-- 
This second version of the patch fixes issues pointed out via sashiko:
- Memory size
- Dt-bindings commit message (binding mentioned twice)
- Remove bootargs
- Correct eMMC slew-rate
Best regards,
Henri


