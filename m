Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013E3606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YnJB5Pi4;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=L5sOuLv2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VCa1si+Rdw90HsiIEyC/2QXZHat4jvLNJ5wZvJeqrHo=; b=YnJB5Pi4D64l1B
	h4KOBLv3cGDVoEhaHBEiVsaWX+lv29AaSkhhUGnpSYx5cpfl1o2Y4aC6IUYR0Gn/XUinFfzplBAy7
	7Rk6lzLekz8V13sAMREsVOCe1W/XEKjgRzDnTh59YOOumWO/XF2lRmu9iJVv3C5QPgAnO+T+ph5aJ
	5/Icdck0NIQhv9PTlb2oyhzOGmeC18rGZDy6EskISypQyUdjjnXNsn4zmLLhTn/TkSs11QqY+6kCa
	BjzuaPjW9RslfXIjJpvLTooXeIUoTWW8uN4i9hHiNAhe2iEopelGjL9hvB5O8tRvhKOq1j7Tp/FrU
	QxQgLcGd3KIbZAhtCtwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsEu-00000006rhL-3DLw;
	Tue, 24 Nov 2026 15:15:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsEr-00000006rgR-2tB8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 15:15:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 47DE1497;
	Tue, 24 Nov 2026 07:15:17 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A8D83F763;
	Tue, 24 Nov 2026 07:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795533320; bh=6z7AZlLUL2DO+OdyjCHQWwyHNa89NmXSmwHe52ByhhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L5sOuLv2W/AW84dHcy5h3x3Ld1v3cAaNC+yDmhHBSsvfdR/A4pNfghRoNO4gddfAQ
	 r7DCS9BJ+Ym+pCXK6NqN0JIYBn0cPajbC5S1D39TZs6I3YyU8KNs9qngX5RwyW8IQc
	 fwE6g94hEfLQ88hBzFYMYu6TNkfYhwfKLwX2GQ0Y=
Message-ID: <2ce0d340-c26f-4382-a341-bbcfb5575a8c@arm.com>
Date: Tue, 24 Nov 2026 16:15:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com>
 <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com>
 <20261121112312.75ba7299@ryzen.lan> <20261121-a733-dt-v4-2-reply@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261121-a733-dt-v4-2-reply@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_071521_837843_0E0A16BD 
X-CRM114-Status: GOOD (  16.31  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/23/26 18:42, Enzo Adriano wrote:
>> So what's the purpose of this cpu-map really if it's all flat?
>> I wonder what the term "cluster" should really mean, here? I mean there
>> are surely different types of cores connected, with separate frequency
>> and power domains. So the cpu-map should not be flat, but describe that.
>> Yes, they all use the same MPIDR affinity level, and the manual talks
>> of "cluster0" only, but I wonder if this is not what this node here is
>> about.
>> Looks like the RK3588 also uses the same affinity level for all cores,
>> but has a differentiated cpu-map.
> 
> The map records the topology in the A733 User Manual v1.00,
> section 5.1.2, figure 5-1. The six A55s and two A76s sit in one
> DynamIQ unit and share L3.

I would be careful with what's shown in those diagrams, they often 
simplify things, and Allwinner's documentation doesn't have the best 
reputation when it comes to fidelity ;-)

> The BSP's separate PLLs, CPU frequency
> policies and DCDC5/DCDC3 supplies (A7S schematic sheet 4) describe
> two DVFS groups. Mainline can describe those with the clocks,
> separate opp-shared tables and CPU supplies.

Yes, they are separate now, whereas older SoCs would only allow one 
voltage and one frequency, across all cores. But those were v8.0 cores, 
without an DSU.
 From what I gathered, it is an explicit feature of those DynamIQ DSUs 
to combine multiple microarchitectures in one "cluster", and allow 
separate frequency and power domains. The shared L3 cache seems to be 
the defining feature of a "cluster" now.

> RK3588 and GS101 both use 4+2+2 maps. MediaTek changed MT8195,
> MT8192 and MT8186 to one cluster each. The MT8195 patch says the
> big and little CPUs are "in one cluster: fix the CPU map to reflect
> that." The other two patches make the same point for their SoCs.

Ah, so there are indeed conflicting examples. Apparently this cpu-map 
and the topology described there doesn't mean too much anymore, in 
practical terms.

> 
> https://lore.kernel.org/r/20230126103526.417039-2-angelogioacchino.delregno@collabora.com
> https://lore.kernel.org/r/20230126103526.417039-3-angelogioacchino.delregno@collabora.com
> https://lore.kernel.org/r/20230126103526.417039-4-angelogioacchino.delregno@collabora.com
> 
> I kept one cluster in v5. Do you still prefer a 6+2 split?

No, with this information just one cluster, in a "flat" map, is fine.

Thanks,
Andre


