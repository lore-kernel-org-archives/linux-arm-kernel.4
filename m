Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0796606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 06:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jMmCWR8r;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSka+pfu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=; b=jMmCWR8rPaTOFweFCfD2s4LI5p
	Prs2+QNXStDyNb4QRcqjVuJVjLINiO3N2bWPUJYvxp+JTaw09mz5Q8cE74WZl+mfhv2GKiC0CjhWW
	xk9xWWn92JhrdmvlHuglWJp33LQ1XIZwPZKX6pZ4nOb3JlqPXBfGRRtIiWcmKprh9u+cANzMRHhS2
	v6qNRYnQr7alp+O3L9nEsFEdLDfCqF9oEQYLllt2Ou4fhSqat61V7VNKsFj04knPzD/hA6RrQu3NP
	YU3vpD3c0diegonJVDkn7JyEv4DOYTgafoyQOWapzKMV/+Lpkjc826pthT1c6hLtquW/0orv94PBA
	HKJaeTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvGa-0000000Axbp-42en;
	Thu, 19 Nov 2026 06:05:04 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvGX-0000000AxaT-1xWv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 06:05:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so274982166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 22:05:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795068299; cv=none;
        d=google.com; s=arc-20260327;
        b=sZvVPXqkKF6GFc0r6gkUuSYGrTSYOVFkFp8hHESfVHBoXv6rLu9h7bBM8H9X9c8ETG
         BI6SHNV7HUwfsWLYt6oNhaVvRoe616izL9oC6OGFdaaozNCEbycWhVSn1L4Lcaty5G5a
         QoaYokJY6Yz/i6uCxWaiM/mfmWgLh8xPCEUF+YliNL6NptQGP5WALxdR3ukRBrQOXpDw
         CcuaOBlV7g8HDRMkjw3iAKI8CC62vXtC1UTJg1Q/b6w+6SUzmjiTmE0fBYbPqbjRU1My
         dmAM/oy7GxpjDofswNlrQ99yUVVe+l/Yd0AjkgX6BSx/wlQ2iPO7DPJjMgFW6szA26JX
         2VOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
        fh=JB+LsdWeovyT3HmhPxbeG+5oydxg3q9dCrQMc8eSTsY=;
        b=pvrStMaWKPfwLO49d0b01m1wm3cAdJTmdjlfj0dmXAs79Lmn1kLwJV/WmQ9IItNtoE
         /Pziap1JqZxUbt6zDCBLQ3o1vtQ/AuoJZ9GwaHJMmXtfwOUeW1nWsJL6ar9iHnfSle4U
         sAWa7eACsprKxB9Ekm3hrJcXEx60wthgrejDwHKrMPNYl2aP1zixn747uHOOFwsNx09m
         qdVqqy41Whn/xqrcX/bOQe37Nl9DY7Ra0zXKJFpfxGAB/C5sfIy457/E7lI0BOEOSKjd
         s22ZYAissPhScp8X6bFXKI53G/Kz3T8fB50Kum8/sneTYWdcV0CLqBQeFg9fzKHCSN3G
         3GiQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795068299; x=1795673099; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
        b=WSka+pfuKzOVMBHEor8x5K9S3AV7Bph1GrGLkzEChC3W2KNiJoNi8dtqBU/Wc0M9uw
         q5BmYio/4mqf09dlYFyvR00S+PQLT3+aFq+g5M33kg66gd+pD0O0gaAqzAXknNhotHot
         IX6dP8tqGWJKDcFAil3zkkVz4KXpZ6gA+0kWBOq9q6wtHw2tQRP3tRobLYOHkb6cDoV5
         MutY31eXwat5MmEATohe3ApAo1UTZ6QU8d2CPHd4svKgriGKZ2PiRGckyO6n1L29gZjB
         g+8cFaXC4gPwWui+DZMFikyGoZGVXLXihk7HvVK8UKYliWT3F/ieci6LBIZrxZpJsbhv
         Q8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795068299; x=1795673099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g7tiKu6iToFwXv5ORc/C2e3umAfzd5HxlGVwlZD9DEQ=;
        b=hCSbMRzVCE0fDPRuL6vzqbbAZ/KFvov0luLospQmdZ21naTtQdk5v4XlUltZedEQ8F
         nycO8xyDdwg41WZS2tQfZQeplPfTrOjiXkFLhhLN2mdP8xY1qB1GEGhJD6uIG76yzpMr
         rrrXnwCnGjmMAkkjnxwCZup2LNtOf9flpFQD5FngYeWqlQoncKE0tL2XhRyzOX6jVraB
         LJXAjUrZbFExTkeBGIkTIYcPvUi/1fnWJN85prt/SRefGEIqSkvtWY16HcuMUPapwg1a
         /6Rt1BNNqSpHymJlorLRzj+S/oW1eYHeBoStnbV8veMVf5XJ8eRQAtCHTAJUmYbGk9PY
         ni4g==
X-Forwarded-Encrypted: i=1; AL+hErE4ZJZoNFKH7bRpTFdt88NMGcQjdze60bogqG7wnXM1dJU57AEPM1NbzfwxTaTcvLico+fGeHENQtr3Yq3XqrB5@lists.infradead.org
X-Gm-Message-State: APuU4Z9sVsDL273Y5iJ+XTshQj1r1AZRSppcKrcwgF7OD8EKocXxUUp8
	aZutkr725l7ox7H7R2QqzlVnd3dq6HHD/N1S7HMgcTQ9yn10kQet5ta9tA/L+COqjYIKfnoCgmc
	JS1kngZO2EkJaHyUC1GjyiRqothjkImQ=
X-Gm-Gg: AYBFou2iP8oB4/teoGXjX+I5aTlpWNND1YShEPLJUhYtndqabV7UQ06qW8/0mq2eHT6
	KfHwht6W82kftSkn6i7/vVGmP/YFOJIax7yR0pMdLK8x0Zfz8jxgtaiWm6L2fCNk4k54tLmqi6E
	O3w/i/6vY+qUAVMlsdqAcsYVdSEqAIqa5mibH4mylugNufVukSbm2U4z1lUpVIum2hTz+0Whnez
	k/mvUI9C8W9M6gxW9Qr+MzmFa0YD2s20LETM99rpxzrH1WVbs8owt/x0GM37YLDqRHWrGt5vm9G
	2U+8nQj27s1vTiY/Di+fLD6cMPY7JYxKSUSWiX9uyXfjo4G21cOo2mF+5gVeyjqnoUvnnE3ZjZm
	02UQWprXTKvYvp8vxNC6AIFFzJwFK67m0klY=
X-Received: by 2002:a17:906:c104:b0:c4d:28ba:f221 with SMTP id
 a640c23a62f3a-c510e5903demr427620066b.42.1795068298655; Wed, 18 Nov 2026
 22:04:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv>
In-Reply-To: <20261119-b4-rockchip-pcie-hib-v1-1-05df24cc77e6@iav.lv>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 19 Nov 2026 11:34:40 +0530
X-Gm-Features: AclHuK-yj0qp-k9YYA6fs3KiQog3XEeJOKWZ7G7ZFB-glkWEk6yaKExA1sPwYKk
Message-ID: <CANAwSgRaHubdh8o5Zd3k5Sa_jf5fWuEuCXqbQu7gGL71MwC+8g@mail.gmail.com>
Subject: Re: [PATCH] PCI: rockchip-host: Support hibernation with endpoints in D0
To: iav@iav.lv
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_220501_531740_2CBC4B45 
X-CRM114-Status: GOOD (  35.27  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Igor,


On Thu, 19 Nov 2026 at 06:42, Igor Velkov via B4 Relay
<devnull+iav.iav.lv@kernel.org> wrote:
>
> From: Igor Velkov <iav@iav.lv>
>
> The driver runs its suspend callback on every system sleep transition,
> including hibernation freeze and the quiesce step of the kernel that
> loads the image. The PCI core leaves the endpoints in D0 there, the
> link does not enter L2 after PME_Turn_Off, and hibernation aborts:
>
>   rockchip-pcie f8000000.pcie: PCIe link enter L2 timeout!
>   rockchip-pcie f8000000.pcie: PM: failed to freeze noirq: error -110
>
> Keep the link up across freeze and thaw. On restore, power the port
> down and bring it up as on resume, because the kernel that loaded the
> image may have left it in any state. The port may already be down if
> poweroff_noirq ran, so track that state.
>
It looks like we aren't disabling all the PCIe regulators (0.9V, 1.8V,
3.3V, and 12V)
during suspend and re-enabling them during resume.
Shouldn't we power down all of them on suspend and bring them back up on resume?

Thanks
-Anand

> Signed-off-by: Igor Velkov <iav@iav.lv>
> ---
> Tested on v7.4-rc3 with this patch, ROCK Pi 4A with a WD SN770 NVMe:
> 5 of 5 hibernation cycles restored, the NVMe readable after each.
> ---
>  drivers/pci/controller/pcie-rockchip-host.c | 33 +++++++++++++++++++++++++++--
>  drivers/pci/controller/pcie-rockchip.h      |  1 +
>  2 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index 1e1556e436b8..df4b9b3ec031 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -863,6 +863,8 @@ static int rockchip_pcie_suspend_noirq(struct device *dev)
>
>         regulator_disable(rockchip->vpcie0v9);
>
> +       rockchip->powered_down = true;
> +
>         return ret;
>  }
>
> @@ -893,6 +895,8 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
>         rockchip_pcie_update_txcredit_mui(rockchip);
>         rockchip_pcie_enable_interrupts(rockchip);
>
> +       rockchip->powered_down = false;
> +
>         return 0;
>
>  err_err_deinit_port:
> @@ -904,6 +908,25 @@ static int rockchip_pcie_resume_noirq(struct device *dev)
>         return err;
>  }
>
> +static int rockchip_pcie_restore_noirq(struct device *dev)
> +{
> +       struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> +
> +       /*
> +        * The boot kernel may have left the port in any state, while the image
> +        * holds the enable counts of a running port. Power it down so that
> +        * resume brings it up from scratch.
> +        */
> +       if (!rockchip->powered_down) {
> +               rockchip_pcie_deinit_phys(rockchip);
> +               rockchip_pcie_disable_clocks(rockchip);
> +               regulator_disable(rockchip->vpcie0v9);
> +               rockchip->powered_down = true;
> +       }
> +
> +       return rockchip_pcie_resume_noirq(dev);
> +}
> +
>  static int rockchip_pcie_probe(struct platform_device *pdev)
>  {
>         struct rockchip_pcie *rockchip;
> @@ -1011,9 +1034,15 @@ static void rockchip_pcie_remove(struct platform_device *pdev)
>         regulator_disable(rockchip->vpcie0v9);
>  }
>
> +/*
> + * Freeze leaves the endpoints in D0 and the link does not reach L2 then,
> + * so keep the link up across freeze and thaw; restore re-inits the port.
> + */
>  static const struct dev_pm_ops rockchip_pcie_pm_ops = {
> -       NOIRQ_SYSTEM_SLEEP_PM_OPS(rockchip_pcie_suspend_noirq,
> -                                 rockchip_pcie_resume_noirq)
> +       .suspend_noirq = pm_sleep_ptr(rockchip_pcie_suspend_noirq),
> +       .resume_noirq = pm_sleep_ptr(rockchip_pcie_resume_noirq),
> +       .poweroff_noirq = pm_sleep_ptr(rockchip_pcie_suspend_noirq),
> +       .restore_noirq = pm_sleep_ptr(rockchip_pcie_restore_noirq),
>  };
>
>  static const struct of_device_id rockchip_pcie_of_match[] = {
> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> index b5da15601b58..51877678d3df 100644
> --- a/drivers/pci/controller/pcie-rockchip.h
> +++ b/drivers/pci/controller/pcie-rockchip.h
> @@ -324,6 +324,7 @@ struct rockchip_pcie {
>         void    __iomem *msg_region;
>         phys_addr_t msg_bus_addr;
>         bool is_rc;
> +       bool powered_down;
>         struct resource *mem_res;
>  };
>
>
> ---
> base-commit: 35f800669ce835aa77364a2ab5b61be19b778d3c
> change-id: 20261119-b4-rockchip-pcie-hib-004e1adc4042
>
> Best regards,
> --
> Igor Velkov <iav@iav.lv>
>
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

