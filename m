Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32402606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pBgqc9Wz;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kud4b5sK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QZY3QEbTazJVBNLfkYhq96DccGik9lwrQlsFGiS8+BM=; b=pBgqc9WzoCMWy73xxxeBkIEdOq
	okDXAEMVvwDlj5klMkW6CPCn6DhRL4SVP10Qt5/L9U+7V3ZZl1j/t5gFIAeB739fi76hxG7t60lpY
	ByS+wvBqYi/jbdxuhT248A3EbFcA9dANJ6DYMtTNH1nnhnVA3+AWfAM/SDju0B8wlCEWyVOl3+SKp
	zfyM7TpqCMHsnUPywNjWkCOWJqU6qS7UEUuYJrcWXUbooGD6C8p60di2iXAWwLGzch8228/Di2gJA
	vHyXqRfgXqftKR57/8D6QQw2xNjGqdb9eX8wr1ifKPQ3+FZnX5syJ081aD1eNXDvUbtd6+TxfiPfd
	V+EOOigg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcvz-000000057e8-0lGk;
	Mon, 23 Nov 2026 22:54:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcvx-000000057dy-2dkn;
	Mon, 23 Nov 2026 22:54:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 51A2F42B6C;
	Mon, 23 Nov 2026 22:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9EA1F000E0;
	Mon, 23 Nov 2026 22:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795474488;
	bh=QZY3QEbTazJVBNLfkYhq96DccGik9lwrQlsFGiS8+BM=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Kud4b5sK91u5SBmL8lPGIPTN3CP4ATH85EG1moMmnUj+tCyZ0v8511LIpcjMDEoyz
	 hXY8ps3kX6luSVimz1DL6w/4v5XS3DVwUhuQbkGmU/X2il+gRYmCZtVqR23bFanmSl
	 Dl8czKObWKjkuDOOoojGPffwA/hzs17niUNQsMcAce/LLJwD1vtNNMvahJFR3lKBo7
	 91mQ5CLCB3pQclrn2mhzQrNaTb16nOaPOKJcN8Q6chuOiFNmkbvmBcewM9/mdGNKea
	 bh4CHAmXA8WiB8Y2kO9AEWts847SxOKF65TwM1vfTLxrLZ0khTRsDy48k1r9GPMfkS
	 kKKZ03sSSQ6nQ==
Date: Mon, 23 Nov 2026 16:54:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] soc: cortina: Add CS7542 PCIe control, SerDes and
 host support
Message-ID: <20261123225447.GA1119216@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 23, 2026 at 11:32:14PM +0300, Fil Dunsky wrote:
> Add CS7542 PCIe support with global gate/reset controls, a Snow Bush
> SerDes PHY and DesignWare host glue. The global syscon already provides
> the APB/CPU/AXI clocks; extend that same provider with three PCIe gates
> and controller resets. No resource-less pcie-control child is created.
> The existing clock indices remain unchanged; PCIe gets named specifiers.
> ...

> Changes in v2:
> - Expose PCIe gates/resets on the existing global syscon provider.
> - Remove the virtual child binding and separate gate/reset driver.
> - Preserve early strap clocks and unwind partial registration failures.
> - Put clocks before interrupts in the host binding and example.
> - Enable root-port MSI after enumeration; dispose INTx mappings on teardown.
> - Return 0 for lost-link DBI reads to fail iATU polling; serialize quiesce,
>   config/DBI access and IRQ draining before reset.
> - Link to v1: https://patch.msgid.link/20261123-b4-cs7542-pcie-v1-0-4cde5201d404@gmail.com

v1: Date: Mon, 23 Nov 2026 21:43:28 +0300
v2: Date: Mon, 23 Nov 2026 23:32:14 +0300

That's way too fast and wastes reviewers' time.  Please wait at least
a few days between versions.

