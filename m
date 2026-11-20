Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A395A606A325
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HHbMfHg5;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=YXJoNf0+;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=cmCbpp0G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Le0RPn46jHF9e4i2vrYXLIAxlLMBBuxuXIJhsmU5VKw=; b=HHbMfHg58BtjoD
	QodNhQyjjBi7qWsMKwn6eWhTSB5pzHk2HAvTmbkTCAcIjB+7Yw+RsDb61RyEw6guptabF8FyYt774
	QfoI6skzJtHBe+PEY+YWwhA4/RG5SN4+E81Qgol6Z7A4hUYFPHInSJJ0wLtl0JaYujs8aZEu7luao
	7VUyN9Ut+qZttOSjUCpzBrhnKWNIZrwZiIeWG1vcGDdQ9fmP+SRfqk25HusQVWTmbC38tQ69rUrCu
	SlAP8+AUkj5FwWjo19lm4vnPbddXoTVPRs/DH5lo41V+alx6LXQoRp0EWGh7AfsiDQQKJ3maQptvf
	5qN9RwKbITaSKZMRrbOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM0G-0000000EcKx-13kt;
	Fri, 20 Nov 2026 10:38:00 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUM0D-0000000EcJd-0Q1l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:37:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795171075; bh=Le0RPn46jHF9e4i2vrYXLIAxlLMBBuxuXIJhsmU5VKw=;
 b=YXJoNf0+gkkCAQG7BToaJ+S8Mqs3FXHFreAyHgNr4CiQngmytSia/6spVoRwP51NuIG4XuAT1
 GMQizFXj4i9vRVUFcZj7y/TDBkwNDq71WfShUm5XErNGNmGYNz/yHJJXXZyU6ZZwEcABjfK76uH
 NjEywXSVdc8tLFr2oLuCGq2cdXGvhHJejPykFcWKYgEpOecsTQ9kSwdxejQQua8IwrcEbMvnRI/
 Gqm8g1sIgC4zBOuUj1w8rwlI4oVSnvd4KuruYp/I7AF3wbe/dbRqziIMtdgxPb+MHzQ7dCDOW50
 Cjteu3+6XUOQoBh7DXQP98Rfxu+rw09OuH08v1KnaYsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From:
 Content-Language: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795171075; bh=Le0RPn46jHF9e4i2vrYXLIAxlLMBBuxuXIJhsmU5VKw=;
 b=cmCbpp0G9LxpbPH7zNXp8bOvvWz7e3t4reT/mDqS8oZxgMswkuH2lNsSwjggxpMrecMUjKxlT
 Qp1n31Wd/UxNHWqi+/qEE/Nqw5gvceIb7diefNptVc9RYW/sYKBAwIcmoWmDlWAlv+lcIR3SRAQ
 HvI4yQ8fBLGguwwVev4LJKo=
CFBL-Feedback-ID: 6b0022e231c8f29e7611d90e:8bdc011d3cb26b1315eaa2ace58e4003
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0022e231c8f29e7611d90e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <38fbfd13-526c-47cd-b723-2ac4e77682ae@kwiboo.se>
Date: Fri, 20 Nov 2026 11:37:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: clock: rockchip: Add RK3572 CRU
To: Cunhao Lu <1579567540@qq.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Richard Cochran <richardcochran@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, netdev
 <netdev@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117-add-board-ok3572-c-clk-v6-0-cabad6610c5f@qq.com>
 <20261117-add-board-ok3572-c-clk-v6-1-cabad6610c5f@qq.com>
 <34dbd46a-29cc-4b86-b9cb-9477dc0a4da8@kwiboo.se>
 <tencent_BB5901AB88D47E874D0E348B32A609A92308@qq.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <tencent_BB5901AB88D47E874D0E348B32A609A92308@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_023757_224334_2809BE93 
X-CRM114-Status: GOOD (  25.79  )
X-Spam-Score: -2.0 (--)
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Cunhao Lu,

On 11/20/2026 10:40 AM, Cunhao Lu wrote:
> Hi Jonas,
> 
> Thank you for your review.
> 
>> [...]
>>> +#define PCLK_DDR_MON 527
>>> +
>>> +/* Secure clocks */
>>> +#define ACLK_CCI 600
>>> +#define SCLK_DDR 601
>>> +#define CLK_STIMER0_ROOT 602
>>> +#define PCLK_SECURE_S 603
>>> +#define HCLK_SECURE_S 604
>>> +#define ACLK_SECURE_S 605
>>> +#define CLK_PKA_CRYPTO_S 606
>>> +#define PCLK_KLAD 607
>>> +#define HCLK_CRYPTO_S 608
>>> +#define HCLK_KLAD 609
>>> +#define ACLK_CRYPTO_S 610
>>> +#define PCLK_OTPC_S 611
>>> +#define CLK_OTPC_S 612
>>> +#define PCLK_WDT_S 613
>>> +#define TCLK_WDT_S 614
>>> +#define HCLK_TRNG_S 615
>>
>> Are these secure clocks meant to be used as SCMI clock ids? Why a gap from
>> 527 to 600? If I am not mistaken SCMI ids should similar to Linux clock ids
>> start at 0 and be a consecutive series.
> 
> Yes, these are SCMI clock IDs. The CRU IDs end at 527, but the SCMI
> IDs are a separate set. The vendor header [1] uses 600-615 for this
> group, matching the IDs in the released RK3572 BL31 firmware.
> 
> I haven't found the RK3572 BL31 source on GitHub, so I can't rebuild
> the firmware. That also means I can't change the clock IDs it exposes
> via SCMI. If I numbered this group from zero in the binding, Linux
> would request ID 1 for the DDR clock, but the firmware on existing
> boards expects 601. With those IDs, I wouldn't be able to read the
> correct clock data on my board.
> 
> I'll add the SCMI_ prefix in the next version and keep the firmware IDs
> unchanged.

Great, I think the SCMI standard may dictate that IDs should start at 0,
and I expect the vendor firmware possible would fail SCMI validation.

Not sure there is any point to use different IDs for vendor and mainline
firmware. Hopefully we can nudge Rockchip to closer follow specification
in firmware for next SoC.

> 
>> [...]
>>> +/* CRU-->SOFTRST_CON01 */
>>> +#define SRST_ARESETN_TOP_BIU                     0
>>> +#define SRST_PRESETN_TOP_BIU                     1
>>> +#define SRST_ARESETN_TOP_MID_BIU                 2
>>> +#define SRST_HRESETN_TOP_BIU                     3
>>
>> Please drop the unnecessary/redundant RESETN in all constants. The SRST
>> prefix is already a short for Software Reset.
> 
> I'll fix the names in the next version.
> 
>> Please see [1] for the header I prepared for U-Boot mainline RK3572 support,
>> it should have all these symbols cleaned up, to match naming patterns used
>> for all currently supported Rockchip SoCs.
>>
>> [1] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/rk3562/include/dt-bindings/reset/rockchip%2Crk3572-cru.h
> 
> Thanks, I'll follow the naming convention in your header in the next
> revision. I did notice two possible issues with the reset IDs:
> 
> Your header skips 421 between SRST_LINKSYM_HDMITXPHY0 (420) and
> SRST_P_PHPPHY_CRU (422). I've fixed this gap in the current patch.

Looks like I just applied renaming and not re-numbering, so this gap
originates from vendor source header. Good catch :-)

> 
> Your header also assigns ID 453 to both SRST_H_PMU1_BIU and
> SRST_H_PMU1_FW, but the lookup table [2] maps them to bits 9 and 10
> of PMU1 SOFTRST_CON03, respectively. Could you confirm whether these
> two reset lines are meant to share an ID?

This duplicate seem to originate from the reset header in vendor U-Boot
v5 branch [3], that I used for my mainline U-Boot work on RK3572. That
and the fact that I did not re-number the indices. So I am expecting the
vendor Linux 6.12 version is more correct (does not contain the vendor
U-Boot duplication of 453).

[3] https://github.com/rockchip-linux/u-boot/blob/v5/dts/upstream/include/dt-bindings/reset/rockchip%2Crk3572-cru.h

Regards,
Jonas

> 
> [1] https://github.com/rockchip-linux/kernel/blob/470f9dccbdc42e7b8a824d0a5c5640a10e9457d2/include/dt-bindings/clock/rockchip,rk3572-cru.h#L542-L560
> [2] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/blob/85afc941266af08ab30a897dde794f952321025a/drivers/reset/rst-rk3572.c#L605-606
> 
> Best regards,
> Cunhao Lu
> 
> pw-bot: cr


