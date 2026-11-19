Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2F606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 10:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5D34SOHE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=p4ujRYqqmDAxwCH1lLG5Y1TyM4iee8k+HiSVgBJl0UA=; b=5D34SOHE7xC7CE
	GIfCvkkf76+JAgMoSm2vZKuPpFiVkptYFEweQ/TcZJt6rgCsXxgogxNdvZzwdFgrB9Np1XjWI+q5c
	8gIVPgYAMDMuf+WuudEVRSnqv3DMubqFU6uw0GXpzl77YnSxBkzRx/N4Xl8NfnAlXhVxVkjOyRqI/
	83P+Htw9TufGL/BE2VXzXFnNWYMHJcSzyTjaL8xZEHbhJXVBcFfF1cM5revGv8kG2Ogk6m8Vl8uf8
	18knBxP+HDIajVG5B8d+NhhS2UAdQhvF9OzmTzX5UEViSyw6OK2G00jn8xvre+P+hWwQTX1VPOG6a
	pr1L9+LvZUrKidhEjgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzlI-0000000Bbgk-1y30;
	Thu, 19 Nov 2026 10:53:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzlH-0000000BbgX-0Jkn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 10:53:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 36F586207D;
	Thu, 19 Nov 2026 10:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B931F000C5;
	Thu, 19 Nov 2026 10:52:59 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9] PCI: exynos: Handle PCIe PHY initialization errors
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Cc: alim.akhtar@samsung.com, bhelgaas@google.com, jingoohan1@gmail.com, 
 krzk@kernel.org, kwilczynski@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 lpieralisi@kernel.org, mani@kernel.org, peter.griffin@linaro.org, 
 robh@kernel.org
In-Reply-To: <20261031094911.3304-1-sreekuttan2156239@gmail.com>
References: <20261029131006.2744-1-sreekuttan2156239@gmail.com>
 <20261031094911.3304-1-sreekuttan2156239@gmail.com>
Date: Thu, 19 Nov 2026 11:52:53 +0100
Message-Id: <179508557305.20612.514486261245057380.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1383;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo2o/m3xmhc0NHfbRYvN0+MKz7iNbWMaHqO6Ffi134E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq/tUGDxYT92TkFJ8h+M/UgumGXqTFY41DMP4c4
 oCoGLS+Zn6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCav7VBgAKCRBVnxHm/pHO
 9UdgCACNwn/rHgmgZW7N9z5xuwd/BcFD92q0D71p6SkcsMguN72bKKI/g1+xXy8+XjH2TxLb9Bi
 ChgsRrTsCyn8Tb/vGIA1RT11JBgv3RMu6NpHhY3zVJq1AyVRiDL7uf6iaoRGQi1MDGhRd000zoz
 IWEEsRJxJZZhAs+rynGJJDC73KcNNMpk+0qYyM/U08dzb1jo3qRrIrBBzzDItyaEBPT3Q6T5QKC
 5/iFYvJ93HsBoL5um8rAzVch8/rEuOhx4kK8xEpFHuzDyTW6HizxmCR6V79Cd14oZXKZ7RThWGZ
 pU2j9fj2dcAukWuv7QeD2tYeqLf9g5L/9SUoYg2W7dhJij+0
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-31 09:49 +0000, Sreeraj S Kurup wrote:
> Check the return values of phy_init() and phy_power_on() to avoid
> continuing PCIe host initialization when PHY setup fails.
> 
> Track PHY initialization, PHY power, and regulator enable state
> across probe, remove, suspend, and resume to ensure cleanup is
> performed only when appropriate and to prevent unbalanced
> reference counts.
> 
> Assert core reset on probe failure after PHY initialization has
> been reached, and handle cleanup errors during teardown and
> suspend.
> 
> Also check the return value of exynos_pcie_host_init() during
> resume and abort the resume sequence if PHY initialization fails.
> 
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

NACK.

First of all, you are sending each version as a reply to the previous one, which
is not recommended.

Second, you just ended up fixing all Sashiko reported issues without cross
checking whether they are really valid or not and the patch just became noise
now. For instance, this phy_init() can never fail on the only platform supported
by this driver and there is no PHY power_on() callback (idk why phy_power_on()
exists in the first place). So all the error handling you added for these APIs
are dead code.

So please, do not blindly fix all the issues reported by Sashiko. Do your own
homework!

- Mani


