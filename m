Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB09606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k99NFsHC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fTMA9QsA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=M4EvdhyPClJMonTpG0zYcUFgKQRAM7QCzBagwXo5SNI=; b=k99NFsHCpsscyr
	l7M7Zv/GhPJS9FW1c67WbZlWU5es3UYTvALBvVwmsoNFOFNf9VSInqXcjGTCxHz/7GSloUdx5lwRt
	No/WmRzn/E2iZp01CRbSXJw80DlrRFdMgzdrpOuGRL5zbcFw9p5Pvbu5pmxbDl6vrceRyZsAwGkgU
	EZvnEUS0kCExOUm5b5UHdGDVBhqIcMag5us5jhIUWPXOdK47/PTRpUC/ObAFHj3CciGTXLlnRDiwt
	sHv0a+0szNe2t8sust3Bb8U00GCEoDG6ZPnFGayza5wFUocfANJ+ed1+8mNWYU7SwUtZtcf7lW1TQ
	W3QJKacMiikgDw7vp25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyTW-0000000H0Mk-2U6t;
	Fri, 27 Nov 2026 16:07:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyTQ-0000000H0MX-3nrT;
	Fri, 27 Nov 2026 16:06:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B3986183C;
	Fri, 27 Nov 2026 16:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1351F00893;
	Fri, 27 Nov 2026 16:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795616;
	bh=M4EvdhyPClJMonTpG0zYcUFgKQRAM7QCzBagwXo5SNI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fTMA9QsAwB8bJPOSJOPUWFydDiG1PFYiPq8NMLN6HWt97nVhIQlKvDBFizn8Y+Dkg
	 phSPHhMZIxvj782ArtqbmQsFo+AeXb1JlY5DogSChOcv9ttQY1BVFALOtQav0XmHWw
	 uc2MDzMvRZyxyoZjdI38ro+caUANoCjYBXq5onvAxX5Vz3Rv5bGtHtE7VM/jbOAx5L
	 2HUTHyPPGKgAxIhqSpNSF5uVpqog/mf1EFF02gn/gnPdEw84bXRrvHYZRajIzsftUX
	 Jgn+EzB5bTbwqAPTLOpxw5F2S3d2pt2KHNCsbeAaFg/0AiLcrHx2zTw69wZGmyGNJX
	 QH5BIIYAtcxwA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] phy: exynos5-usbdrd: gs101 PIPE3 init fixes
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, RD Babiera <rdbabiera@google.com>, 
 Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
 phone-devel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
References: <20261123-gs101-usb-phy-orientation-v2-0-3361fa5f7543@linaro.org>
Date: Fri, 27 Nov 2026 21:36:46 +0530
Message-Id: <179579560687.13164.8486442411400032367.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=mani@kernel.org;
 h=from:subject:message-id; bh=BDcgJiWbnqhGl/C9aGkP0Jx2TSH6tbuFkGPv6K1lORk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaqZxGLwsp+vABHqDZIpMAqVrDp7VLN3WHr2P
 Y3OeQ44F26JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmqmQAKCRBVnxHm/pHO
 9amwB/wMm5K3gEqZushzryzNcFitBxYM6BVq+8mETT90/M4B2CtNodxrMJToUpKpRJyS6NZWadt
 3Yee6EJtro3np+SYKcl3iEOzS6bSu27QDA1HhTaw6CmhZBpKs8wXEjh+nS81QjwlIBxZun7lbpb
 zTt3QsH109D8cS239fDSVSOnVOubRA4hocjnZoqEiYa1AFWR2wjEdD/3b7cjjcewPXJqrHnnoJH
 roFHJ+SRVfQ2CYVNLT/ce2AsglbLDFtMm/UKYbtcuOz0jumEs+FbJ1ZeUYHF5p8sqBJyT1I3I2r
 QrY8CC/ikYP2abjZKV5c00yX6hIuCiFO6dWeuTaGcrdNk6h7
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-23 14:25 +0000, André Draszik wrote:
> Hi,
> 
> This series contains two fixes for the USB 3.1 PIPE3 PHY initialization
> on Google Tensor gs101:
> 
> 1. Re-initialize the PIPE3 PHY from the Type-C orientation switch
>    callback when the orientation changes while the PHY is already
>    initialized. When a cable is connected during boot, the PHY can be
>    initialized before the TCPC reports the orientation, and DWC3 runtime
>    PM is forbidden by default. Without re-initializing, the SuperSpeed
>    lanes stay programmed for the wrong orientation and the link comes up
>    in high-speed only.
> 
> 2. Apply the existing gs101_tunes_pipe3_postlock[] table once the PLL
>    and CDR have locked. It disables the high-speed RX squelch detector
>    in P3 / U3 to save power while the link is suspended. The table was
>    added in commit 32267c29bc7d ("phy: exynos5-usbdrd: support Exynos
>    USBDRD 3.1 combo phy (HS & SS)") but never applied.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



