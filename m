Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A9D606A320
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 08:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RocCmWpS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ommer.net header.i=@ommer.net header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FHxxy+w3;
	dkim=fail reason="signature verification failed" header.d=ommer.net header.i=@ommer.net header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=wBej/f69
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=; b=RocCmWpSemUCLTAuUT111MZoIX
	cF4aSGq8afSdKydpbyPOVlyz3Bw6mKiLC4L3RrtjjQiBD1g7Hl06zJFE2kODHcKZ+SaRHv//gE/gD
	J077AK/7YJgt/qtprNayufQYSI7EdpxEOMS2B6CL0RchnE5yUi7w0NwPwUUZrFz3XdPjpzZjypS9y
	J0paIdaYEJ/EzZ9H5bHXKE7l5KWAHBUoA4MYr5qPhPO11E0tlKob/8bHE/YY3djLxAXMz7Igv4f2x
	aGia/DjZxN50rPy+d63zGOGbUuiSyFjEqnY80fc0VLw1nUW/gUSxVwH9Qo17nYZMl2MIoeNvXA+gm
	Z87OMbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgOj-0000000GvSq-2yot;
	Sat, 21 Nov 2026 08:24:37 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUgOg-0000000GvRm-1Ygz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 08:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795249459; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=b9KSdTWqkGfFZR6jPt9UOvEqd/aOMIofLcBAvzUaq4VUX8sbadtoaXGUwCF16FUAfg
    RYBipf5SD7HYHBaBbMspv+Yhi4f7zwiaR/S0FzNTzsbFi50MLY+uVRpuqLKmzgSOB5QX
    BZwP3NEMqsci22iTUDyiJZibqdHTlya04tRgsup7cghkk3/nu1/zElj+qfCzJwzBTi/5
    jQwfFSfpErKjv415HeN/zTZbDFajreoJLM8zfUv2o/IlwzRQaxE3cYi3dEi7JaKxEPPR
    4xKISpsGVufmVwHhQOAev/ge9Vb7T2EOvZmtwWqCNdVKwkQQ5G+HY82bt3gpKDFcHG6i
    hUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249459;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
    b=HJEssbgq0c+MXMf/XhzMCdzF94VSbT8LsPv7h2dEu1e3Q4m3/sf+Mg5xlFEiQ1dKvJ
    9rVhiMemvPGBvRsNIIBKSG4rlLkE6DlBXVXGBqPhq4AsWyjfZ51zFLodtZVeBjOEDbhQ
    1rSyW7v5zoih8U04vnNS+3cM7p78Nlh/bGqMFEcQGosttwxvQYmseXgi0qKNN2GRHj7O
    sHvy4PnQTsoSSpWHlx4jfz5QuMbeGNyG7D/zcgzskErtUERkhbayjywNvwTE6plYLlFK
    f3QPZ850swNc/JRI9Z1Go/Dk5zJ8Fb7MLMuM+mh1AA/PiiFdjdaQ49Nkv21tuhrs8P57
    RYDA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795249459;
    s=strato-dkim-0002; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
    b=FHxxy+w3z6dhqc0UtInhEfkzoxNU/Q5Zpd6JnHD7NZ1MGwmwD8NkyFrwDGGloKEpzH
    fMrTYk1XQj403aAc1ZaKYTzPxvgnlUAHYlr1w4fWcG8+Jogs4N45aG8C857yx4xjb3Iu
    4nhPQDJohulmPR7I6qILJyqU/JzG7EMbVtTcBi0o1422x0BJhugepEAL3Mw9E+coIB3z
    eEPgxyvjCTUR4T/7JWGUr8z23HIhte9rFTzLg6zQZm+qRJlOw0ZjIPGxoSRfUNC2vn6R
    X/Eo6YRX6CvEEB+RL+/9uDeSdmgJv7a8ROpZ23hxoDPZPqjJJ+eg50oyCb9hyWEiU09A
    nFJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795249459;
    s=strato-dkim-0003; d=ommer.net;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=EIZIrUh5piCY5yNTOAXj6/6dGogGhw2YSeRm45ufSRM=;
    b=wBej/f69MuwqR2NghqrUf2b4ouH6FckwbUoG4yV6CRiFhShHmSzA86qyX0Twfn1kEV
    grL+gkLDGo0E+O8c27Bw==
X-RZG-AUTH: ":JGkKZ0mIdPJLfj3rk5MOrv6kH/tvwFubxUqMvsWOyVXJkOABZnPqvKUstHY8FQgi4y8Fiu3j5HL2zuVyTQ9NDYXzNSFFaQ=="
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id n2f42d2AL8OJV57
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Nov 2026 09:24:19 +0100 (CET)
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
Subject: [PATCH 0/2] Add Samsung Galaxy A20e support
Date: Sat, 21 Nov 2026 09:24:02 +0100
Message-ID: <20261121082404.24864-1-henri@ommer.net>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_002434_671328_CF4D9786 
X-CRM114-Status: GOOD (  10.73  )
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
  dt-bindings: arm: samsung: samsung-boards: Add bindings for
    a20e/SM-A202F
  arm64: exynos: Add support for Samsung Galaxy A20e

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../arm64/boot/dts/exynos/exynos7885-a20e.dts | 132 ++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7885-a20e.dts

-- 
2.56.0


