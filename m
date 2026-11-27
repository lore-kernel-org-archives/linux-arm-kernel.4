Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C3E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 15:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UxKKJ/Tu;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iWSl5ikj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O8pnsdU3vMqGq7ELmjvq5FdeahOXIlHE/MoodaIfQgo=; b=UxKKJ/TuPM12sX
	ZkiElC1ND6QfnT2SB0OStPXX6HT8CSRm7I1AIM2dex1puvK8sq4aWLAfXbHwdbBMaMM/MQK78bBqH
	xoHUO6V/jCrtS/flJeewuGcnEgxot6M9bAXPC25aVPLyrNu6pSwuTKUiPnMwszwTWbWJXlcmzDPzW
	XNhqXJyHXv7wzXLNOsU+hklyKKqNTYwXmakrwAiRLzNuD4aV0YBmmI3Okr3we8N7ndjhCodagrMzI
	jC9V1mQAVDXcI3dKSl8+gxqAWxBs3ZIBwR8AYBDVYmC0B9g9ZRy/4jyncYmciZeenkDqs4xKW/VBj
	gN2LDELT1dPffwtXLIjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyAm-0000000GuFJ-2VBo;
	Fri, 27 Nov 2026 15:47:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyAl-0000000GuEi-0CnB;
	Fri, 27 Nov 2026 15:47:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B644244455;
	Fri, 27 Nov 2026 15:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BA51F0089C;
	Fri, 27 Nov 2026 15:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795794458;
	bh=O8pnsdU3vMqGq7ELmjvq5FdeahOXIlHE/MoodaIfQgo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iWSl5ikj8sFU5KxMqaRSyhp7KVRgAMSiocSR1PLgEVzvwIfi4WCTyC0AigbNbupxF
	 gJHu3oNouhMl/rozFT5q4DpadukydxjvgLsAn2pfa4KiYPOwYERt3D5DtxL/H5eGO6
	 H2ypwzUHz7l4x3T3Qi7S8YWzVzW5nk5Ko+Eba83/Ak61NBoOlR6Yqqt3GLJzmRv9Hl
	 2WjAbdGqS3VRu1H43sqX0lFv8k1EMjLxd4DWnnrIdnph3RdCG87cseWTF9cpI2ate3
	 bCOuvgVH14+PLMtpS8/zHsR25ax1GI+Rl5BodzdG1TKv4KTIBsf9Z71uJF0PEk2XKE
	 bHSvfr+cLW16g==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] phy: phy-google-usb: reset USB3 PHY before init
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, RD Babiera <rdbabiera@google.com>, 
 Neill Kapron <nkapron@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20261119-lga-usbphy-init-v1-1-1de4e0e6b191@linaro.org>
References: <20261119-lga-usbphy-init-v1-1-1de4e0e6b191@linaro.org>
Date: Fri, 27 Nov 2026 21:17:30 +0530
Message-Id: <179579445030.13164.13282265230853414841.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2306; i=mani@kernel.org;
 h=from:subject:message-id; bh=fnovCDIUZdtvw2vTP29UBKPpf7kuHTKrlAWxg8QfSxM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCaYV3UsWw1F2M3UeRNjFwQqz9XcGW9J7j0s1V
 lc6og/PmOiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmmFQAKCRBVnxHm/pHO
 9cd4B/9OuKmRIaV82B7CID7lApzBQDZSTm72kOMba5g28fwiBJ2mejOrdOYOorpUAIByv6Hz/4I
 WRxd71gfqT2sIm5fqU97Duwr298JHwIlBHiiqCdclMBEqnC5Hsdg5ckzzjpj4tj0C6/H44Rc3eJ
 v7b+QjT7xDBXR0ROUutXjAbgNjHAHXnyVPNuKLdja7VxmcURAvbVRhUoV4pUEFDhI6qXwVXrLK4
 PT/sjsFp2+PoVfR/cJKHdcLaOUBfuhlRttgj4CTiBr28i6CilTF+aDCWRKCpgmv/pk1G0Yirejp
 L+YvrHuVmafbq5yrtJinIANoZMtnqzPAHyqEBIZZo+Dy/Rdy
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

On 2026-11-19 10:47 +0000, André Draszik wrote:
> google_usb3_phy_init() assumes that the PHY is in reset and that the
> Type-C Assist (TCA) block is in its power-on state. Neither is the
> case when the driver probes for the first time on Pixel 10, where the
> boot loader has used USB before: the PHY is out of reset and
> operational (lane0 phystatus is low right away, whereas it takes about
> 12ms for a PHY that really was in reset), and the TCA has been
> switched to USB already (TCA_TCPC reads 0x1).
> 
> When the PHY is initialised in that state, the soft reset of the DWC3
> controller hangs in about one out of four boots on blazer (Pixel 10
> Pro, 12 of 50 boots), with DCTL.CSFTRST still set seconds later:
> 
>     dwc3-google c400000.usb: DWC3 controller soft reset failed.
>     dwc3-google c400000.usb: error -ETIMEDOUT: failed to initialize core
> 
> In addition, google_usb3_phy_power_on() waits for the TCA to report
> that the transition to 'no connection' has completed. The TCA starts
> that transition by itself after a power-on reset (TCA_TCPC resets to a
> request for it). Without a power-on reset there is no such transition,
> and the wait only succeeds as long as the event is still pending from
> earlier. Just asserting the PHY resets before initialising the PHY is
> therefore not enough: the event was gone in 8 of 32 boots then, and
> powering on the PHY failed with "PoR->NC transition timeout".
> 
> So, before initialising the PHY:
> * assert its resets and drop the reference clock request, which is the
>   state google_usb3_phy_exit() leaves the PHY in
> * clear the TCA's events and request the transition to 'no
>   connection', so that google_usb3_phy_power_on() waits for a
>   transition that this initialisation has caused
> 
> The resets are kept asserted for 1ms. That is the duration that has
> been tested, not a documented requirement.
> 
> With this, USB came up in 20 of 20 boots on blazer, and in 25 of 25
> re-probes of the controller (unbind and bind of dwc3-google).
> 
> Fixes: 8c2b331e6327 ("phy: Add USB3 PHY support to Google Tensor SoC USB PHY driver")
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



