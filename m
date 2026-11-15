Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32642606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 16:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kj+R/0Kc;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UM/RNRGo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NCd7gUU6HGHaZLtUO73+KIOy/CnHOnCqa5r0SPBNmTU=; b=Kj+R/0KcEPNvbr
	3UVc0k0UIhX4bINGYwTxtCjH3w+ANwc+/FdyxaRGbgpSpS+Vwyoo+kWg3XcxVq5yoH1ubFjfmHaKU
	l1ASOKz9wsVBgRT6gUCzlaxPi8nySUfqMiWEKdtdjPWUIbMRdIAo33e1X6BC54vNqzxA1tG6xbPDE
	dmaAspe4w56SxprClKpENNtlZiHydj7TVcb+UNp47OfXB3/37/D2gfcdVB5ZkDoQEwhkfIWhQHl76
	i9HHMr/uWFgS/uuNx1DZ3aXqmUgxhEOB7r71f9/v4Y395MUbETPN6JAVyjYT6pAmUryP2k+vws1C6
	iDiwi962yHyZcP567YZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSd1L-00000000Bcl-1wb9;
	Sun, 15 Nov 2026 16:23:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSd1J-00000000Bcf-3Dl7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 16:23:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D327F60051;
	Sun, 15 Nov 2026 16:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD02E1F000C4;
	Sun, 15 Nov 2026 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794759836;
	bh=NCd7gUU6HGHaZLtUO73+KIOy/CnHOnCqa5r0SPBNmTU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UM/RNRGo6lEAU1ZmUJhXH07ppVCefYyTsmrrSDGR94znDL/OTXxidPBXk3JosHgXR
	 UAzJe+b04n9PNxERO7MokrRJvBp5dorTY4N8aLUtLN4P0JDGvq7jhcNKwgw9UCQaC7
	 u9Sgrhmamo/flZ/AEttZN/nS6FNa06nde9sJ0oZCeVuXqlNZyjEw1441M8dqAYly8+
	 bv3Z+3/vVmxno0ipvMFj1PPmeA7lbdw8uWhP7LgDqykpGINt0JeA5ZqE9PW5uV9l7r
	 z7mzSkIDfmTSBtwyMu3A2g5v9zeVfNnJ7bZbSqqFH+UoyJ5dPOEkzxvvdmho0tNGxS
	 BpnA5gGOXm7/Q==
Message-ID: <68bacdb1-41e8-41b7-96b8-22169c6e78ee@kernel.org>
Date: Sun, 15 Nov 2026 17:23:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: PCI: apple,pcie: Add M3 generation
 compatibles
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Neal Gompa <neal@gompa.dev>,
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 Michael Reeves <michael.reeves077@gmail.com>,
 Joshua Peisach <jpeisach@ubuntu.com>, Mark Kettenis <kettenis@openbsd.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
References: <20261108-apple-m3-pcie-v2-0-0e5ffec71da4@jannau.net>
 <20261108-apple-m3-pcie-v2-2-0e5ffec71da4@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20261108-apple-m3-pcie-v2-2-0e5ffec71da4@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 08.11.26 15:22, Janne Grunau wrote:
> The PCIe controller on Apple M3, M3 Pro, Max and Ultra SoCs are
> compatible with the one on M2 Pro and Max. Add their per SoC compatibles
> "apple,t8122-pcie" (M3), "apple,t6030-pcie" (M3 Pro) and
> "apple,t6031-pcie" (M3 Max/Ultra) to the bindings.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> 
> ---

Do you guys want to take this patch through the pci tree or should I 
just pick it up with the rest and route it through apple-soc since there 
are no driver changes here?


Thanks,


Sven


