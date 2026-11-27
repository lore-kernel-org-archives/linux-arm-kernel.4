Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75684606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 12:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zybm1VQL;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dqG3yN7n
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=X4kfaiVur+cv7ACUutyaSv/1OtD9q8Aja3Q/LtqseRo=; b=Zybm1VQLQsco1/
	nyDj6HlrY7yfCBJA7FHOOqcpZ8f6nTSDc9Rq17tMhv3rrAt0EhU6y3+gPGDr4VfFhDZ+/epeM1ikj
	PmnwcYzcv9LeIKI6pOQAciJ4EYteQhUtn1i5Kkf3CEEhMTZiSQ82HpXOA/F7ap7UcKRDVXWQn9vJY
	TIqfTWYZvRfZ8CO42CNrW5XHiISV50uOSVkR1aRfVQxNCi+pl9PO1j7+vaDap0Oi/XktAo8nA4C6Z
	wadVuxnnwFByQPcW7jY3CgUNVmJth6X5YzwgFSQayxf0D9Ah+wynfsaY+wpyZblfnkE/dabTR9NoY
	I2G/nsmNcEkXqg+EqrIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWubk-0000000Fve4-27gO;
	Fri, 27 Nov 2026 11:59:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWubi-0000000FvdO-2ZWC;
	Fri, 27 Nov 2026 11:59:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0305E629B1;
	Fri, 27 Nov 2026 11:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40D8F1F02809;
	Fri, 27 Nov 2026 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780753;
	bh=X4kfaiVur+cv7ACUutyaSv/1OtD9q8Aja3Q/LtqseRo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dqG3yN7nISyTWtF1R2GwmK98IjcPUPf+g/u6Xa+7tGyAu9kGwKnSdd8+pR/OCTM5r
	 C+MRnamg2GnJpQdCm9K8ZqZQ0XVy4O8Uc9hsptJSsOar7xU/8PakvVGrMMVW7Z1Xj7
	 nrsUWYoCh904bs216H+OOK94HEL9/ozFGAlEgtr/2XGQBsov6ThBTzI6lX4nlYfmTs
	 GeSDJAuuxzgx01KiytAAGWaSkZYOFwJ3SooyCh+HhLudozH4+laiTE2LL8JKYEFjOD
	 UXhp3f74E9cQaacOLzQLKJtswJu3mnKtnhYfytrHk98ybqxSpqtVAyEcLF4xfCFtVi
	 6fqewrC/vb/fA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] phy: exynos5-usbdrd: fix HS phy init count imbalance
 on Exynos2200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Soheyb <soheyb_boulaa@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
References: <20261109221522.2796426-1-soheyb_boulaa@proton.me>
Date: Fri, 27 Nov 2026 17:29:04 +0530
Message-Id: <179578074498.13164.12931562027223515149.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2175; i=mani@kernel.org;
 h=from:subject:message-id; bh=p6d2iEwVEUY+/j47JyZwmjKq5uIbHpo82iXyjlHo0f8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCXCM24kKb+8h2Bep4TN9AXjsVrm4SL3mhUnSz
 vXEi2WOU/GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawlwjAAKCRBVnxHm/pHO
 9dQBB/0WrkCe5N23g0EgwH46xNiAYn2oau5oIDzwdoaiNTY0dT5C0USIEWwisI6MZz+rl8gt/J7
 pTKxPbPQ0USEwZeyqgJ3r16Yz4Cd4yyJZ0pEHBpmNE+GZrBSATHRsDLjcxf424gLe/s29izVto8
 redXPK8wu/48rx32TsUgqD/yzR3fv5H4H/UNLukf3J3dmvpBeX+Hs6bUnemnp0Jjk1IEwRoTcVA
 IqUu20NINdpwqNn5q60FO0xVZ6sTBKBJQmc6oW9L9bJsioKSYbfTqw+9rqWnOXfGG0Kc+72ZSxn
 Iu3sjdAw4F27Jwv95OrJg/YYk81I+3uRm4VqpuAcmqknzZSJ
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-09 22:15 +0000, Soheyb wrote:
> exynos2200_usbdrd_utmi_init() calls phy_init() on the high-speed phy,
> but exynos2200_usbdrd_phy_exit() never calls phy_exit() on it. The init
> count of the high-speed phy therefore never drops back to zero: after
> the first init, every later phy_init() of it returns early, and its
> clocks and supplies stay enabled across an exit of the UTMI phy.
> 
> When the high-speed phy loses power while the controller is suspended,
> it is thus not set up again on resume, and the DWC3 core soft reset
> times out:
> 
>   dwc3 11210000.usb: DWC3 controller soft reset failed
> 
> Exit the high-speed phy when the UTMI phy exits, first, in the reverse
> order of the init.
> 
> Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Soheyb <soheyb_boulaa@proton.me>
> ---
> Tested on a Google Pixel 9 (Tensor G4) with an out-of-tree port that
> uses the Exynos2200 phy ops and powers the USB block off in system
> sleep: without this change the soft reset failed on the first resume;
> with it, USB came back after each of two system sleeps. Not tested on
> Exynos2200 hardware.
> 
>  drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> index 087d552..0bee928 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -1486,6 +1486,13 @@ static int exynos2200_usbdrd_phy_exit(struct phy *phy)
>  	u32 reg;
>  	int ret;
>  
> +	/*
> +	 * The UTMI init initializes the high-speed phy; exit it in turn, so
> +	 * that the next init sets it up again after it lost power.
> +	 */

Same comment as Ivaylo. Code is self explanatory, so comment here is a noise.
LLMs tend to insert comments even when not needed. So you should trim them or
ask them to not add comments where not really needed.

With the comment removed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Please respin.

- Mani



