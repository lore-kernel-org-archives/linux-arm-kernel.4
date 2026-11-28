Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12165606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2026 08:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/vAJZj5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=sC0u+Ypx4dW4BDufXD8QEGkBrDgreDlR4Dt/7XSyxFU=; b=O/vAJZj5Q5uCxR
	okuT0w5qPpkb0JlrkWkiR8QLgeFVTxY2TQ/EZBFR7SKGohVo9ce+MxwRcaIVE0/J3luLChQdwDnYz
	SQfC+Fu5oLgIfUsfjyRNR8t+vsK4f2RjKtUIftU74L/quGfCoVpW1A6Qe9LcBgQUAEFzV/p8/410l
	D02DftigmQtht6NK2UqRHtafQpwpaX4jTo0aSfSw1Nnz8O9nyDXGX3WNV2VS+XJS8XGaYx4WuqkSB
	Ew4TdqB9g/EvaX5h9oxnLlDRs3+A3R2r+esZra+SdBHoIe5NegkSE/0Bxbw3OdJ3UA7smM28i2jq1
	Cfss+ZG3qGkazX2cVMdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEAf-00000000Yv2-0Ull;
	Sat, 28 Nov 2026 08:52:37 +0000
Received: from mx1.markusglobal.com ([89.147.111.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXEAb-00000000YuI-135c
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Nov 2026 08:52:35 +0000
Received: from mx1.markusglobal.com (localhost [127.0.0.1])
	by mx1.markusglobal.com (Postfix) with ESMTP id 4jc3VD4S50zCryr
	for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Nov 2026 08:34:12 +0000 (UTC)
X-Virus-Scanned: Debian amavis at mx1.markusglobal.com
Received: from mx1.markusglobal.com ([127.0.0.1])
 by mx1.markusglobal.com (mx1.markusglobal.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 9vWWbPTKg69W for <linux-arm-kernel@lists.infradead.org>;
 Sat, 28 Nov 2026 08:34:12 +0000 (UTC)
Received: from [10.132.52.115] (unknown [150.228.243.38])
	by mx1.markusglobal.com (Postfix) with ESMTPSA id 4jc3V520ZzzCrhR;
	Sat, 28 Nov 2026 08:34:04 +0000 (UTC)
Message-ID: <17e86b6f-25af-43fc-b0ca-a0eb982e6cf4@fiftyone-percent.net>
Date: Sat, 28 Nov 2026 19:34:01 +1100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/3] net: ethernet: mtk_eth_soc: fix the RX
To: Sandeep Haemoon <sandeeph@loljews.com>, netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 Mason Chang <mason-cw.chang@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
Content-Language: en-US
From: Eugene Markus <eugene@fiftyone-percent.net>
In-Reply-To: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_005233_628560_5F45BC11 
X-CRM114-Status: GOOD (  17.01  )
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
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sat, 14 Nov 2026 00:34:14 +0200, Sandeep Haemoon wrote:
 > Reset dma_addr to DMA_MAPPING_ERROR at the start of every iteration,
 > so a descriptor that is released without a new mapping keeps its own
 > address bits.

This bug is not theoretical: it has been corrupting memory in the field
on a BPI-R4 Pro 8X (MT7988A, 8 GiB) running OpenWrt main (r38441,
kernel 6.18.60) as a home router with a Bitcoin node behind it. We
arrived at the same one-line fix independently before finding this
series, and have tested it on that board.

You wrote on 22 Nov that the issue fixed in 1/3 came from automated
review and had not been triggered at runtime. On this board it is
triggered, through the refill allocation failure path, as below.

Symptoms, five times, between 8 minutes and 2 h 47 min into a sync with
the node's peers on the WAN port (the GMAC's own port, not DSA):
  - "BUG: Bad page map" in the node's process, then "Unable to handle
    kernel paging request" in unmap_page_range() and a panic;
  - "get_swap_device: Bad swap file entry" with no swap configured;
  - LevelDB "block checksum mismatch" on files intact on disk.
The corrupted pages held a received WAN frame starting at byte 256
(MTK_PP_HEADROOM): a page-table page had the board's WAN MAC followed by
the gateway's MAC at entry 32, and a LevelDB page in the page cache held
a complete IPv4/TCP frame from a peer's port 8333. The trigger is a
page_pool allocation failure: the page cache fills the 8 GiB and free
memory sat at 60-120 MB.

Bench test, RAM-booted kernel with PAGE_TABLE_CHECK, DEBUG_PAGEALLOC
and KFENCE; a test-only switch making every Nth RX refill fail (standing
in for a page_pool failure) and another restoring the old dma_addr
handling; a user process holding 6000 MB with a known pattern that
reports every changed page with its physical address (pagemap); TCP
into the GMAC at line rate:

   dma_addr handling   refills released with   pages changed
                       another buffer's bits
   old, run 1          166                     70, each a WAN frame
                                               at byte 256
   old, run 2          11                      4, each at exactly the
                                               address the driver
                                               computed (e.g. frame to
                                               0x1613cf100, page
                                               0x1613cf000 changed in
                                               bytes 256..1775)
   this patch          0 (59,817 and 45,274    0
                       would have been)

The other misdirected frames pointed below 0x40000000, where this SoC
has no RAM but has device registers and PCIe windows. No kernel errors
were logged in any phase: the debug options cannot see a device write.

On the board itself, the node then synced 57,736 blocks (about 6 hours
of continuous peer traffic) with this patch and no corruption; the build
before it, without the patch, corrupted after 2 h 47 min.

As this is silent memory corruption with network-supplied contents on
shipping MT7988 boards with more than 4 GiB, could 1/3 go to net on its
own, with Cc: stable, ahead of the jumbo frame work?

The analysis of the corrupted pages, the driver reading and the bench
tests were done with an AI coding assistant (Claude Code); I ran them on
my board and have checked the results.

Tested-by: Eugene Markus <eugene@fiftyone-percent.net>

