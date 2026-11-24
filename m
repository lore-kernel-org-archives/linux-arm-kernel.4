Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9692606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2stLlFOv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=klNlh1sd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HAmhaTwlq0ql9vpEfF30JAvsIWV3GCSiNAxons2m7lE=; b=2stLlFOvpzVEWF
	BGbcZBKaNMwbOMVwa+8vScI/FqU/Oru2CO7fNnxYeDG6gk/7tDP4AM3kzSX3pUlxqyjnT4qCjrayt
	cMhOywIm2BjQOLGfQgzkfzhQDPtsOltLKMowLyWsSNOQin3ktzE0IA9fippbDIyXyr4zu0XR1a7KH
	Au/B6Lblj8x6WvLX5TIuOhCdEZLKTiiHZNSWwt2sGXhfkShwyroiwiif9LApQARn53S19uO/cQbx0
	i5zoCWe+o8xQlFvGv5K6QEtfF5a5MTV67EsHMXEtBRmOndgH3zf6J4RrRiugna/1AzbMlesXbFYwQ
	7MlFqYqCD6LhW6WYcZsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp6f-00000006QrH-3PST;
	Tue, 24 Nov 2026 11:54:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVp6e-00000006QrA-12xD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 11:54:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AC840412AF;
	Tue, 24 Nov 2026 11:54:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A321F000D2;
	Tue, 24 Nov 2026 11:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795521279;
	bh=HAmhaTwlq0ql9vpEfF30JAvsIWV3GCSiNAxons2m7lE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=klNlh1sdr91oxUGKW9agsfOzeuWO6an+iHiQdLW3AI0IpE0482b+mUMmEy4k0dZeh
	 2HIJmzpgS8IlGlE104nDfQycIN2ucAQCHK5yqWpFoJdAB5Nhzexvhe2P/YJr0W+fnC
	 59y+dJSjUTIKv8eJ4Lx+eoCL8sqt25dhjg1lYzYeytGtcrD5geuOvC2UWZfJsfewFT
	 YPkUfcx2UOvqiNkIE6ijkELonEnRCPGtksMq1+rRRy68XJ6Ef0OSDc0qx68jl7bNrD
	 bgXWNNBQl65CxQWnbAcc1M+U7dBKWRaNW0YaFFJUFTekUWjpW+uS5Ai4Vtas73rnKh
	 rrKERPyHvpUMw==
From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@oss.nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de, 
 lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
 bhelgaas@google.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20261109022139.3226052-1-hongxing.zhu@oss.nxp.com>
References: <20261109022139.3226052-1-hongxing.zhu@oss.nxp.com>
Subject: Re: [PATCH v2] PCI: imx6: Enable L1SS support when supports_clkreq
 is true
Message-Id: <179552127457.34411.18338691732347833133.b4-ty@b4>
Date: Tue, 24 Nov 2026 12:54:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 09 Nov 2026 10:21:39 +0800, hongxing.zhu@oss.nxp.com wrote:
> Enable L1SS for the i.MX6 PCIe controller when the `supports_clkreq` flag
> is set. This ensures that the PCIe endpoint can enter low-power states
> efficiently when the link is not in use.
> 
> The commit a00bba406b5a ("PCI: dwc: Advertise L1 PM Substates only if
> driver requests it") clears L1SS capabilities by default. However, the
> i.MX PCIe controller supports L1SS as indicated by the settings in the L1SS
> capabilities register. By setting `dw_pcie.l1ss_support` to true when
> `supports_clkreq` is true, enable proper utilization of L1SS for i.MX6 PCIe
> configurations.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Enable L1SS support when supports_clkreq is true
      commit: adf478a1cc9985ca1e7143fc185f2a4c59da7a30

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



