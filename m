Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614D7606A321
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 15:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DsgqKEDJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xXjNLXbKtaiU3JiuzfGRd1QmG4o+s1nbrs6MCjtYeJs=; b=DsgqKEDJ1VNloBK8NyFitioGFf
	kZmNYSZjz13coh1BR3DOMasD1CpJ8SzLmNGXWJ02Y+InIFe9EP1A8ryuRGqdsVGy4dWAjJy9JNuPO
	rRVhfdDup1/u5Z1VAsEDLu9q65gpHVBMohqilwJuNftIAnMDVuZ0xi43DPxVNc1gP7odkEKVggptG
	bd+r+aLu09BBTk38PKajpeYF3DbNHsMUZiCNZwGPjTPnAX5weW7vneCtvNH5pLOWfy8D+tAUwRP86
	zzzEY3S0jMNqzcBQctBzpori/Q188+Xa9bE1H4QDlvDmlVBAzVzIXtCwBT+L8taQpGLYqRTcNMIRU
	NDlf82rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJvJ-00000000tAl-322s;
	Sat, 28 Nov 2026 15:01:09 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXJvF-00000000t9g-41Qc;
	Sat, 28 Nov 2026 15:01:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xXJvC-000000003eR-0oXv;
	Sat, 28 Nov 2026 15:01:02 +0000
Date: Sat, 28 Nov 2026 15:00:58 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Alastair D'Silva <alastair@d-silva.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: Re: [PATCH 3/6] clk: sunxi-ng: a733: Mark mbus-msi-lite2 clock as
 critical
Message-ID: <awrsqr_7vfnipcra@makrotopia.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
 <20261127100808.2292229-4-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127100808.2292229-4-alastair@d-silva.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_070106_009901_61479A91 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alastair,

On Fri, Nov 27, 2026 at 09:08:05PM +1100, Alastair D'Silva wrote:
> The mbus-msi-lite2 clock gates the shared MSI-Lite2 DMA fabric used by the
> USB controllers. Without CLK_IS_CRITICAL, clk_disable_unused() gates it off
> and breaks USB 2.0 host DMA transfers.
>
> Mark mbus-msi-lite2 as CLK_IS_CRITICAL, matching mbus-store in this driver.

I ran into the same on the Orange Pi 4 Pro: once the gate is off, the
OHCI frame counter in the HCCA stops and every EHCI transfer times
out, so the on-board hub fails enumeration with -110.

I would rather not make it critical, though, for the same reason as
for MSI-Lite0 in the CCU thread
(<20261125115320.3692954-1-alastair@d-silva.org>): the gate has
consumers, and they are known here. All four EHCI/OHCI controllers
(and the DWC3 of the USB 3 port) sit behind MSI-Lite2, so each of them
can list the gate as a clock, and the clock framework keeps it on
while any of them is in use. A board without USB in use then does not
keep the fabric clocked.

What that takes in this series:

- 5/6: add <&ccu CLK_MBUS_MSI_LITE2> to the clocks of ehci0/ohci0 and
  ehci1/ohci1;
- 2/6: the generic-ehci and generic-ohci bindings have to allow one
  more clock for the A733: five for EHCI (bus EHCI, bus OHCI, OHCI
  module clock, AHB USB SYS and the MSI-Lite2 gate) and four for OHCI;
- ehci-platform: EHCI_MAX_CLKS is 4 today, so it needs to become 5.

With that, and without this patch, all four ports work on the board
here, including the hub, and clk_summary shows mbus-msi-lite2 held by
the host controllers. I can send the binding and ehci-platform parts
for you to fold in, if that helps.

For transparency: an LLM coding assistant helped with the analysis and
with drafting this reply. I personally review every line before
submission and test manually on the hardware.

Cheers,
Daniel

