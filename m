Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA2E606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkcS9YFn;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=YWezaFgy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LqL9E2CsknPEvpMVhLoxgxMbDObTKIGjsIWFOHL2N0I=; b=ZkcS9YFnraSo46
	xuS9XonG+4La0JhILNDJgNlEPuRq2c+dIhDMD5phCbbONVF9bsqECHL9R4xqqsap+SMw20n+cIPk2
	dsQtk40b9tMc3LiMAei6p2d79ilURSKUPfZTUxomgYfjOO9p4+3d7+Obtw/rouJj6p6czr8pKlkFB
	ReSRSPQOkzzhluNmEFtBtA9Lbh+cger21OqDSZ1LVrOy9oDSA0OU/OvhxonNPO+ZXqtNPw6ZdvaTi
	U4RCuK0gS3DkOWujvh68kpDeu/bMjjsm3uFgfVJkWjj5L3dHQFywrhhS38gEBApCOGnEKGc6leblU
	rSan+WWO05arjIU6arkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwkI-00000007hOj-0X5Q;
	Tue, 24 Nov 2026 20:04:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwkF-00000007hOF-1uUR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:04:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AFF2339;
	Tue, 24 Nov 2026 12:03:59 -0800 (PST)
Received: from [172.16.5.16] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE66C3F86C;
	Tue, 24 Nov 2026 12:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795550642; bh=tH2ftS9r4c42XZ26viYlbeouW30U4/gw4lJnh0zk7SU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWezaFgy8T10St9qmvBLJvNxDlbL/eye1ooesVYZOfNAfSSorrjH81ZvoCdRYf8j+
	 PKHCQk6RZLXWbgZ0FWxE7sw4azkh8UT/jpVVnUYrLezL0D22YEQRXDDt5FvnNRUPcq
	 JK0SDhRZNSxWmQHbdZEC7WCFMcUlyCe8nTS/SfbM=
Message-ID: <0e94af87-71d1-4a5c-a2bb-218a2306db27@arm.com>
Date: Tue, 24 Nov 2026 21:03:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
To: wens@kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Junhui Liu <junhui.liu@pigmoral.tech>,
 Jerome Brunet <jbrunet@baylibre.com>, Pablo Mazzini <pmazzini@gmail.com>,
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
 Alexander Sverdlin <alex@sverdlin.org>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
 <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
 <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <CAGb2v64c5oirvfq7R3a1CWQCydfOOipcRD7dhSFAb=zczRdTHw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_120403_579715_A3B4E801 
X-CRM114-Status: GOOD (  26.89  )
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
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/24/26 17:44, Chen-Yu Tsai wrote:
> On Tue, Nov 24, 2026 at 1:42 AM Enzo Adriano
> <enzo.adriano.code@gmail.com> wrote:
>>
>> Provide the SoC description needed by the initial Cubie A7S DTS for its
>> console, PMIC, EEPROM and microSD. Describe the CPUs, PSCI, architectural
>> timers, GIC, RTC, main and always-on clock/reset and pin controllers.
>> Include the main and R-domain UART/I2C instances and MMC0-2 with their
> 
>> pin groups. Use mux 6 for I2C0 on PG8/PG9, as in Radxa's BSP pinctrl
>> driver and its Cubie A7S device tree.
> 
> This should be evident from the schematic itself (the pins are used for
> I2C). And then the datasheet would tell you which mux value it is.
> 
> Just saying, trust the datasheet and schematic a little more than the BSP.
> And one really should write the device tree based on the schematic. The
> BSP is there in case something doesn't work, to look for existing quirks
> or workarounds.

Fully agree with that, the BSP is sketchy at best, especially their DT. 
I have seen contradictory information in there already.

Also I think the commit message reads a bit awkward, at least it 
deviates from what we typically see. I would start with a brief 
introduction of the SoC. Just mentioning that we have the full user 
manual and that this has been tested on a real board should be 
sufficient, then it's obvious where those values come from.
  >> The GIC maintenance PPI 9 and ARMv8.2 EL2 virtual-timer PPI 12 follow
>> the A733 User Manual v1.00, section 12.2.3. The GICD/GICR/ITS windows
>> and noncoherent attributes follow Andre Przywara's public A733
>> reference and the A523 precedent. The CPUX interconnect diagram in
>> section 5.1.2 supports noncoherency as an integration inference. The
>> ITS stays disabled pending its clock/reset and MSI integration.
>>
>> Describe the single DynamIQ unit and shared L3 shown in section 5.1.2
>> (figure 5-1). The big and little DVFS groups can be described by their
>> clocks, OPP tables and supplies. Partition PPI 7 (section 12.2.3,
>> table 12-1) between the Cortex-A55 and Cortex-A76 PMUs so each probes
>> its own core type. Defer capacity-dmips-mhz until it is measured on A733.
>>
>> Link: https://gist.githubusercontent.com/apritzel/60fd7379b9560a15b8b352986b69d39f/raw/efd9cdf8f26ba5b0c7e138f093af44a1cf322469/sun60i-a733.dts
>> Link: https://github.com/radxa/allwinner-bsp/blob/2045a3ca2a01f088c0314dc924bda59d154e363e/drivers/pinctrl/pinctrl-sun60iw2.c#L1591-L1610
>> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
>> ---
>>
>> v4 -> v5: Rename osc to hosc and add the I2C0 PG8/PG9 group. Keep the
>> one-cluster CPU map and the two PMU partitions.
>>
>> Untested on v5: physical CPU/cache topology, PMU counting, EL2
>> interrupt delivery and ITS/MSI.
> 
> Someone please test the PMU.
> 
>>   .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 663 ++++++++++++++++++
>>   1 file changed, 663 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> new file mode 100644
>> index 000000000000..8a258f16751e
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi
>> @@ -0,0 +1,663 @@
> 
> [...]
> 
>> +               uart0: serial@2500000 {
>> +                       compatible = "allwinner,sun60i-a733-uart",
>> +                                    "snps,dw-apb-uart";
> 
> We can't merge this because the bindings haven't been merged. And they seem
> to still be going through a lot of churn?

But I think the binding patch for that is fine? And we are pretty sure 
that we need SoC specific compatible strings for every SoC, actually, 
regardless of how those UART fixes series' (Vinicius' and James') proceed.
So I wonder if you could take just that binding patch already, to not 
block progress here?

Cheers,
Andre

