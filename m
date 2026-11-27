Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7344606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X6r2ZHio;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqdjKXtn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nbfDLkQInsfA1IHCEvKdeWx/1DsneQC2nd/T70CuECc=; b=X6r2ZHiomMoKyr
	o6GzKej8+jd1uqinhviU643wuBKA+wAiV2xgjL/HOyw3p+RKnobyjvyETnVde+5Pf0F9iQ36pdxIX
	ZzXU1ODAMRl83kdAJtGBOCdchWeQ6IOL0LloFZ/DznkGKxOjDp3UW7JQ9LOPkGljKBcQKM76mKSYe
	XgxAPaGnXOiMTlBtMLumDY6Ky0zHoO3TAFuIwycyb1d+loeo6XF5HpuRkAOcHWQ8Mm08L/OYT6IQj
	rJ/r1UEWs119f0LckznWVlDqcQsPtTZUQrfZJUpjjSdyDTDRtnuh9iXjZo/CbYU2wSxwYNnw6TbKa
	VVk61fEWDHGgZEM1TX7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwNQ-0000000GJIL-3Hd0;
	Fri, 27 Nov 2026 13:52:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWwNP-0000000GJIC-0STY;
	Fri, 27 Nov 2026 13:52:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99E6B43C29;
	Fri, 27 Nov 2026 13:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DCD1F00919;
	Fri, 27 Nov 2026 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795787554;
	bh=nbfDLkQInsfA1IHCEvKdeWx/1DsneQC2nd/T70CuECc=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fqdjKXtnxsPzwEun/XtC8U80ZnUo3i5anNTLRddpwxDrFy3ZC1No5srHiyVpOFpho
	 pJ7BAq/+6K0/I9kwETk/jbldSFOVX3CbyRLbdXB4TWr8+Q8a+NMlxBm6KzGMkbFxT1
	 nFgeGxRIaiQXggtfrUZDbxhL6Lf4cZEOcJAu7OCFYeEnMa3w9ZaJIpn2rodgVP/b7E
	 Zx+rjrhDZavLNCChGDJEdbi445bx1CVUYzdQATsbTjhmJEZq4eL162bln+FctpmNlm
	 tDx1oP98oOvwvmKZKOY8nGjMFcwG3WgwVxBrcrKY5Pu8pxFNxO3xPPnyEUNL5Ww3G7
	 aycTN63Q6uMKQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 2/3] phy: exynos5-usbdrd: return the Exynos2200
 high-speed phy init error
From: Manivannan Sadhasivam <mani@kernel.org>
To: Soheyb Boulaa <soheyb_boulaa@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 stable@vger.kernel.org
In-Reply-To: <20261114064400.45572-3-soheyb_boulaa@proton.me>
References: <20261114064400.45572-1-soheyb_boulaa@proton.me>
 <20261114064400.45572-3-soheyb_boulaa@proton.me>
Date: Fri, 27 Nov 2026 19:22:25 +0530
Message-Id: <179578754564.13164.705776957228110174.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=mani@kernel.org;
 h=from:subject:message-id; bh=elvZh/n5AbSfHdAwMngQCW+FoiVHt6RbiZU57XJW9s4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrCYscDiUsjJdO4wJHJUYgxKKxeSu5mO+mfR918
 FApd7jSIsOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawmLHAAKCRBVnxHm/pHO
 9UudB/0SFlnl0zp4ide23j0GiR1TYrxM5vkeEzD8JB8Sd2mSD9S/H9QKug+J27y22IF32ODX2LD
 rMm3oA/075zLamZl+mCoSFRDslxcMwyHPUNx7LoG0ivX+twErJ++HUCI5WnondrkmoM77TzqesI
 +NVu/cIppSJeeLIkJyhVRrMO8Cdy9CDHd5xszerOlO+5sNZkY0daEuKZZTiHZEosqhqcll22rEB
 GAvLDkxLrx3afCI5m9d8JqoS8fvCNww+Ing6dNRigWzALhm4DAqisOvEKflNjxyctEX3rPHcCKU
 3X3kUP+C5unZgulHgNvlwEz7ssJIsCIci/q37LnNkUxAm1rv
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

On 2026-11-14 06:44 +0000, Soheyb Boulaa wrote:
> exynos2200_usbdrd_utmi_init() ignores the result of phy_init() on the
> high-speed phy and returns 0. When the high-speed phy fails to
> initialize, the UTMI phy thus counts as initialized, and the controller
> goes on with a high-speed phy that is not set up.
> 
> Return the result of phy_init(), so that a failed init of the
> high-speed phy fails the init of the UTMI phy. The next patch, which
> exits the high-speed phy with the UTMI phy, relies on it: an exit after
> a failed init would otherwise take the init count of the high-speed
> phy below zero.
> 
> Fixes: cc52a697f87e ("phy: exynos5-usbdrd: support Exynos USBDRD 3.2 4nm controller")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/linux-phy/sashiko-outbox-205724@kernel.org/
> Cc: stable@vger.kernel.org

Drop the tag please.

> Signed-off-by: Soheyb Boulaa <soheyb_boulaa@proton.me>

With tag dropped,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



