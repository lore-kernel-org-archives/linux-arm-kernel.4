Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79358606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 00:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yryt2IVT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tpcTWT12QaKXXVWE6xyenQXiX9YvMws8DucROyKoXMs=; b=yryt2IVTkl2BEk
	2PQ3y2gfYvs9icpgQ2jxmaLgxSfd2RWwnOFM4MzFFAYBUdF4V+hERiCuTYFPRClX+VJ4H6bVm84tW
	oLJsSFb/EkeAEv5CmHua00MxdEDSp0nsxA7zPBrewIvSfHHIikinYt8mzIpEhFhH5KjpgyB/SRHqO
	R0u3u+O8JSe8eMC9Z3c31ta3oEH4+ine1wYPrEk5WUm/3GP3YhD1RFIj9YW6ZzldekN0XW1ykCQeZ
	yYXTQn5DS0wDZAc7WvOJxopWGZQ99ed4qOv4rfer5IL1SxxWPfI50q+Vh7Bn1IvHsY88d4zEzii6t
	t5+Y9k+9noiM6MrsuTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVICA-000000020N9-3YDw;
	Mon, 23 Nov 2026 00:46:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIC9-000000020ML-1cFM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 00:46:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FE6143807;
	Mon, 23 Nov 2026 00:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CE81F000EB;
	Mon, 23 Nov 2026 00:46:04 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] PCI: iproc: Fix MSI shutdown operations
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Eugen Hristev <ehristev@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Marc Zyngier <maz@kernel.org>, Vikram Prakash <vikramp@broadcom.com>, 
 Anup Patel <anup.patel@broadcom.com>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261029-iproc-shutdown-v1-1-05f828561116@kernel.org>
References: <20261029-iproc-shutdown-v1-1-05f828561116@kernel.org>
Date: Mon, 23 Nov 2026 01:45:57 +0100
Message-Id: <179539475780.13869.11962329009845614434.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=rk4nHtNJuQKpfhuulQzD/bItQ8HbmcUiDhVzjTF6j4g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBrA4zIkeT7py+2BT07S2Ivwjb1eYLTTQyC7cLFK
 PdvAczTUIWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCawOMyAAKCRBVnxHm/pHO
 9UTAB/sHuBFC6pxVdZWQpn4k5VXEWSCN5z+WbzVzRCzVL6ffEJoo+H9O6/B5Dz4l796hCvBuak5
 svXe04eRyDSdRFEA7Qn3Fj8bMjgXaWT5hk46I5CRhZTI90kcoFKLYPkvPf5l4EEFOdnbQgeurtV
 oxMXTu4bQeq9kYR4uqqwPx7YVxGpSbhKEeMPe4gsZEi7n6OFsWHtqB6F6S6/h1+XT6D6XD4wBmo
 v5f/kJ49ipszBaDl3xk4RP8AEYIKvE4JP8mbXmVZPwHj2e6WZ+LluHtMZvuDCEPFiMxZzA8Z3fG
 yWjcFMO+y/l+qyA/RCZF47o6m73A9MbRGyiyszLjxHjGZl6X
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-29 09:25 +0200, Eugen Hristev wrote:
> On reboot, shutting down iPROC leaves MSI irqs enabled and not
> cleaned up. This can lead to IRQs being served after the iPROC
> was shutdown.
> Fix it by implementing an MSI shutdown procedure, and call it
> before the iPROC shutdown.
> 
> Assisted-by: Github Copilot

Not needed anymore.

> Fixes: 3bc2b2348835 ("PCI: iproc: Add iProc PCIe MSI support")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>
> ---
>  drivers/pci/controller/pcie-iproc-msi.c | 16 ++++++++++++++++
>  drivers/pci/controller/pcie-iproc.c     |  3 +++
>  drivers/pci/controller/pcie-iproc.h     |  4 ++++
>  3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
> index 9ba242ab9596..1d19db67f314 100644
> --- a/drivers/pci/controller/pcie-iproc-msi.c
> +++ b/drivers/pci/controller/pcie-iproc-msi.c
> @@ -651,6 +651,22 @@ int iproc_msi_init(struct iproc_pcie *pcie, struct device_node *node)
>  }
>  EXPORT_SYMBOL(iproc_msi_init);
>  
> +void iproc_msi_shutdown(struct iproc_pcie *pcie)
> +{
> +	struct iproc_msi *msi = pcie->msi;
> +	unsigned int index;
> +
> +	if (!msi)
> +		return;
> +
> +	iproc_msi_disable(msi);
> +	iproc_msi_read_reg(msi, IPROC_MSI_CTRL, msi->nr_irqs - 1);

What is the purpose of this read?

> +
> +	for (index = 0; index < msi->nr_irqs; index++)
> +		disable_irq(msi->grps[index].gic_irq);

Sashiko raised a concern on this. Please check.

> +}
> +EXPORT_SYMBOL(iproc_msi_shutdown);
> +
>  void iproc_msi_exit(struct iproc_pcie *pcie)
>  {
>  	struct iproc_msi *msi = pcie->msi;
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index afb3aa38ac6b..6f3dc2f81a1c 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -756,8 +756,11 @@ static void iproc_pcie_perst_ctrl(struct iproc_pcie *pcie, bool assert)
>  
>  int iproc_pcie_shutdown(struct iproc_pcie *pcie)
>  {
> +	dev_dbg(pcie->dev, "quiescing MSI before PCIe reset\n");

Please remove these debug messages.

- Mani


