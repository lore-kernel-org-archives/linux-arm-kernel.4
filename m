Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA03606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 03:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9kSYARR;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ph+hLG/U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vBiVRAr+5XLhivQmL9zYbZRsjiirfBfGSpOjwM03dXk=; b=q9kSYARRbyFdKj
	zGi5vRn6apVvdu+yc4nLHaARWP26//LuVCoxj24ZPiFaqMov+pyAcLh57BHo9s94uQWpnI4op4NsG
	Eu1KEfaS/whKUYZf8+yPEGWmzU+baErQypt+gJznMH8K4k5BTr80CnGC6RJJHZ+ywLCQbjEmuMKWo
	zABQW9sahmwSlDE/4pUiq191C9+DKUlADKUHmk+TZcoNZ+unZIsJtkjUaqBeNYbeJGTzNOoyC3/C8
	QY20KS/qYHLReMPtm87DUXJZhSkxovj0ZAxitc27dAADbWUL0zY0qF5rcnDtTQCheATwy5yO1/JU8
	K95xoGn+4xAB6bx4ekcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW46t-00000008MF8-1yxK;
	Wed, 25 Nov 2026 03:55:55 +0000
Received: from mail-m158245.netease.com ([47.251.158.245])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW46n-00000008MEQ-2QuZ;
	Wed, 25 Nov 2026 03:55:53 +0000
Received: from [172.16.12.74] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55e7c8e52;
	Wed, 25 Nov 2026 11:55:34 +0800 (GMT+08:00)
Message-ID: <68d54499-044c-45af-abbb-9aa7bc212db5@rock-chips.com>
Date: Wed, 25 Nov 2026 11:55:34 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] dt-bindings: pwm: Add a new binding for
 rockchip,rk3576-pwm
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>, Alexey Charkov <alchark@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>,
 "chaoyi.chen" <chaoyi.chen@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-1-ae7cfbbe5427@collabora.com>
 <alCvmLX1ke0qjh99@monoceros>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <alCvmLX1ke0qjh99@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa210d8360203a8kunm11819cac735762
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQh1MHlZLSh9KQh1DHU
	9JTk5WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ph+hLG/U/ehuFm1xORwAyVx8Z1h6dMUvRnaVJgrJQMVC1NWYy35lbIWmv5ub87pk4Xpwltj0cIRfK5iIWecdEokKUXIWS1h21FPK1MIlOBLf2n0Hz8Hso6BG8hOGyBIbwU+5Xefao0dS8yLtSFthl5iNKmq2pQN8EdSpwUOhYs8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=vBiVRAr+5XLhivQmL9zYbZRsjiirfBfGSpOjwM03dXk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_195551_530329_7CA76183 
X-CRM114-Status: GOOD (  17.90  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello all,

On 7/10/2026 6:31 PM, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Apr 20, 2026 at 03:52:38PM +0200, Nicolas Frattaroli wrote:
>> The Rockchip RK3576 SoC has a newer PWM controller IP revision than
>> previous Rockchip SoCs. This IP, called "PWMv4" by Rockchip, introduces
>> several new features, and consequently differs in its bindings.
>>
>> Instead of expanding the ever-growing rockchip-pwm binding that already
>> has an if-condition, add an entirely new binding to handle this.
>>
>> There are two additional clocks, "osc" and "rc". These are available for
>> every PWM instance, and the PWM hardware can switch between the "pwm",
>> "osc" and "rc" clock at runtime.
>>
>> The PWM controller also comes with an interrupt now. This interrupt is
>> used to signal various conditions.
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>> ---
>>   .../bindings/pwm/rockchip,rk3576-pwm.yaml          | 77 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  7 ++
>>   2 files changed, 84 insertions(+)
>>

With Nicolas' agreement, I'm planning to take over the RK3576 PWM v4
support work and to restructure the driver to a certain extent.

The RK3576 PWM v4 revision actually provides a large number of
features, such as counter, frequency meter, biphasic (AB) counter, IR
transmitter and IR receiver. All of these features share the same
physical address range. Features that appear unrelated to "PWM" have
been folded into a single PWM block (due to some unavoidable
constraints). In a future v5 revision these features will be split
into separate blocks, each with its own physical address range. This
is the main reason I would like to restructure the driver layout now:
an MFD based v4 driver would have to be reworked into a non-MFD one
for v5 anyway, which would leave us with two drivers duplicating the
same logic.

Nicolas' MFD version is an excellent implementation for runtime
feature switching, but by design intent we prefer the function to be
fixed at hardware design time, i.e. a static selection instead. I have
found two similar existing implementations:

1. TI's eCAP module switches between functions by overriding the
    compatible:

    drivers/counter/ti-ecap-capture.c
    drivers/pwm/pwm-tiecap.c
    Documentation/devicetree/bindings/counter/ti,am62-ecap-capture.yaml
    Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml

2. Samsung's USI module, which Sascha pointed me to, uses a top-level
    node matching the USI driver with one child node per function
    (disabled by default). The board dts then only has to enable the
    child node it wants to use:

    drivers/soc/samsung/exynos-usi.c
    Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml

I would very much appreciate your feedback on this, as your opinion is
key to making sure this restructure does not head in the wrong
direction.

For reference, the planned work is:

1. Settle on a static DTS method to select the PWM v4 features.
2. Merge the PWM v4 support into the existing pwm-rockchip.c driver,
    based on [v5,3/6] pwm: Add rockchip PWMv4 driver. For v4 the
    waveform API already adapted by Nicolas will be used (older
    revisions will be migrated to the waveform API in the future).
3. Add a separate counter driver for the PWM capture function, based
    on [v5,4/6] counter: Add rockchip-pwm-capture driver.

---- (second stage) ----

4. Add a rockchip-cfd.c driver based on the Generic Counter framework,
    supporting the frequency meter and the counter.
5. Add a rockchip-pcd.c driver based on the Generic Counter framework,
    supporting the biphasic (AB) counter.
6. Add a rockchip-ir-tx.c driver based on the RC framework, supporting
    IR TX.
7. Add a rockchip-ir-rx.c driver based on the RC framework, supporting
    IR RX.

Best regards,
Damon


