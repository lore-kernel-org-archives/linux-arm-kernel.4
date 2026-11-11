Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2225606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 02:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n0mYSzhe;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uw1ah7hR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=; b=n0mYSzheOHbs8r
	SZdrKigSlZc2MD/4Vj04+FPYl9C3cwWyAN+smBSZN8p55c+7KQTnTw65Rqjg+AoHvl/YRHX+OJdOI
	XIJTwRYQJQB23gk7yZpx09egZ8Cow7Ro7EtN4BKjiIqZeVXPNFsNTZmNaW0M5iqMBQkh5ft0hBGCA
	68cJFeZlKdHipmsaHyD0YoswUKi7T2IFP+h2JKGrOUbx4Hi+vd5NEs4hdP0ckrs007FrlgKGPogq+
	LiEP7Q1PLjLqk25g/v+ddDs+V3gBrX5g9wrYcdZ6wwRBeSwBZnlRnB1zaC+o8+7MKfxldS+MFnC4B
	eUTyfHYkfS9/BI7RnPQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyNa-00000005U3M-1Llv;
	Wed, 11 Nov 2026 02:48:06 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQyNX-00000005U32-1XUF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 02:48:05 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so23603415e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 18:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794365281; x=1794970081; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
        b=uw1ah7hRxBDHPsDZkNSEiDrXii4IKHFOmFC8+zdVby5hdQBrEYBWoWJXv6k5eaVJiJ
         jkdgdb85mcROIoAf+Tf6PlQmYyTm1mO2Gz2i0fMQmFU16vHGCrxTv38WPfgkcSqBcEOj
         WPc8ANfXk+IUvolR3TwCNvVtX0YBKhoDLKT/P2ei38X6N0R8ZI7PpOeWqaC/3tbKlVfx
         7ga8YnFBpkjHAFwPVyKcXlNrbEgc+6PN17gxZvvTI7XmJIBCXbLo9dYO+E7772lM6di9
         HzunRBVet9l9agTWwT3U9SwR+QWiBDQjUwcaMlkwekYAkLJaTySV9kQLOFU9D8BgbULX
         L2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365281; x=1794970081;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1id8qJVFHopuTMeaIwtQ19aoeuUpNkaOWeyel0rJUA=;
        b=wzQKZDAr1Dyh9eftx9kvHsCE/Q7WPlCtct8Qydqo99qXo0Jna9CZIXxLoDTw6/JcIh
         rhGC1AhZsj3Tn86yDOTRozE8T6m8pSEYdWBZWs6CIWt2H8Us/cHuPXfZG/+GZokZ/lpX
         R3JgXGE9gIcFCMZCxnepPnMpHbWSaGuZODLYQ2FBEJg/wp49+USvi4JA2o1H00XphdBy
         kPQOCdtRliNLrpv3a3IDHcHPFNTomIPeiq8OvBCZxybMgr3oukkTvQNTbIHm5LSPVGkS
         v3bqbmC8FIxn5y1/BQk0/ozGonb14NXSXhyNe5BfQNll5enXdhlQmZhmsKKpOgJd66A9
         02MQ==
X-Forwarded-Encrypted: i=1; AL+hErGM/l9WUSIuE93Y3TpT8QsmNz60zVBEvE0nSlCUQ5b0kzvNST2/Qrlk/TkyhyfNxgeVIgnSrDojcUiGgsD+mpOX@lists.infradead.org
X-Gm-Message-State: APuU4Z/Z1OFsI9KRKjjZVJ7nx0DbwrRUQ0m+c8YMe9HX72vFl32gXySn
	tmm87by4VW58QZF8uOdhLOxX6XHHJ7nF6rtqgFZSEmusUi1dxoq1PFWiTZJMsuVDsnM=
X-Gm-Gg: AYBFou1OwBIZSU8hAnRAki+5DVjPsFjbOXYti2Ma2RYlQU59QogiifC37Tpn/1E+7FD
	BCbdTwjrO69Mq8w/QuhqDczn7n7l/Lp7xpfK1fmc9oY4jee0alfXlbfGURgVfpPI4wnFAk0ULAt
	hlIiJDohPHrSPRoQdu1419GH8BCTBWspiAmk/DnfAoPZdg1Pu62yJI5w+abfvfwUFkFGBUzcbG4
	/ns/7JcHdKr6gPmgcZtqXHj8st6NGXwaZsp7fdU7sjZh/micMTB/1Wj6tKuk2PpCpJHq0qBc+c1
	ky+1as/pSeZ6pkC71k2sS6l40NoOg37yECd5xGDhPG5+q5fmdjT62k6I7EbKihTWjT9gr8CRIr1
	BPRFEjWAm3Nx7NaBPOGisNMLgPx45gsvEvkbzMczeXoa3XnOgj/jo2zxh5n/VmezE9uKZiO85Fv
	RWCqfnSPB4DAEfXHxEdc1pXgrf/vtyv+xTr6R7SO61E1CzbjAwL09IiMchm3w7i/ntvKUvdwVl1
	wl2yK/mXbipaB8Fx2qcFLzVn6s/y8XyaEc6fCIsH+q9GA4gCZ/V20oFBmS+fnuO80tvW0rBw8gF
	bPPjtQf/y0Q2uZxODTlnkCklGug75ZsJu0kKw4cGU3mpwEyiLKFH8aBT9lItmStup2BaUMxa1Gi
	rLW9OK/FWFcQFEA==
X-Received: by 2002:a05:600c:1389:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4ba09388518mr13400485e9.24.1794365280959;
        Tue, 10 Nov 2026 18:48:00 -0800 (PST)
Received: from localhost ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe64bcsm99261205e9.8.2026.11.10.18.47.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 18:48:00 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 02:47:59 +0000
Message-Id: <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Juan Yescas" <jyescas@google.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.21.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org> <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>
In-Reply-To: <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_184803_457546_4C070E08 
X-CRM114-Status: GOOD (  30.59  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Thu Oct 1, 2026 at 2:27 PM BST, Tudor Ambarus wrote:
>
> On 9/30/26 2:54 PM, Alexey Klimov wrote:
>> Hi Tudor,
>>=20
>> On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
>>> Hi, Alexey,
>>> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>>>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmwar=
e
>>>> protocol provides interface for all client drivers to actually use
>>>> features exposed by the APM co-processor.
>>>>
>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>> ---
>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/bo=
ot/dts/exynos/exynos850.dtsi
>>>> index 8a4771899a8e..91c6cee8f483 100644
>>>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>> @@ -11,6 +11,7 @@
>>>>   */
>>>> =20
>>>>  #include <dt-bindings/clock/exynos850.h>
>>>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>>>> =20
>>>> @@ -170,6 +171,18 @@ timer: timer {
>>>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>>>  	};
>>>> =20
>>>> +	firmware {
>>>> +		acpm_ipc: power-management {
>>>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>>>> +			mboxes =3D <&ap2apm_mailbox>;
>>>> +			shmem =3D <&apm_sram>;
>>>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>>>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>>>
>>> Why do you describe these clocks?
>>=20
>>>> +			clock-names =3D "cpucl0", "cpucl1";
>>=20
>> To link these clocks with ACPM clocks from this list:
>> (file drivers/clk/samsung/clk-acpm.c)
>>=20
>> static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
>> 	ACPM_CLK("mif"),
>> 	ACPM_CLK("int"),
>> 	ACPM_CLK("cpucl0"),
>> 	ACPM_CLK("cpucl1"),
>> 	ACPM_CLK("g3d"),
>> 	ACPM_CLK("aud"),
>> 	ACPM_CLK("cam"),
>> 	ACPM_CLK("disp"),
>> 	ACPM_CLK("cp"),
>> };
>>=20
>> Eventually to have some sensible/working ->recalc_rate() for ACPM
>> cpucl{0,1} clocks.
>>=20
>> Which is needed, for instance, for cpufreq_dt because it registers with:
>>=20
>> static struct cpufreq_driver dt_cpufreq_driver =3D {
>>         .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>>                  CPUFREQ_IS_COOLING_DEV,
>>=20
>> Don't know if it answers the question (if I understood it correctly)?
>>=20
>
> Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
> parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
> ->recalc_rate(). Could you please clarify a few things in the commit
> message (and below):

Thanks for the good questions. You hit the exact pain points we have been
debugging on hardware with cpufreq-dt and Panfrost devfreq.

> 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding the
>    APM hardware, they are the PLLs that ACPM reconfigures behind the
>    scenes. Meanwhile, acpm_clk_register() sets num_parents =3D 1 and
>    pdata.fw_name =3D name for all 9 clocks in exynos850_acpm_clks[].
>    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
>    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanently
>    orphaned in CCF with rate =3D 0?

Correct. Is it a problem now since there are no "clients" or consumers or
users of these clocks?

Or do you suggest to link them all to parents clocks to have a sensible
rate?

> 2. Does bypass_acpm_exynos850_get_rate() actually return the updated rate
>    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
>    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
>    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
>    __clk_recalc_rates() only reads the cached core->parent->rate without
>    calling ->recalc_rate() on the parent itself. Won't parent_rate remain
>    stuck at the initial boot frequency?

This was already asked and seems there are no answers. The problem with
stale rate is present.
https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@linaro=
.org/

Any suggestions? It does seem to be a real problem since we discussed this
again off the list and cpufreq may stuck because of this.

We can cache the ACPM clock set_rate if the call succeeded for instance
(option 2 in the URL above).
I have such patch somewhere locally and Thomas also cooked a version
with caching. Will it be an acceptable approach?

The other thing is that we may need an initial rate set if reading of
a rate happens before first ACPM set rate call.
Is it fine to return parent's clock rate in such case? For this approach
we actually need linking to parent clocks.
Or should we hardcode some boot values in the driver for instance?
We can also potentially hardcode PLL clocks to get one-time boot
(initial values) for ACPM clocks and avoid using parent's clocks
toplogy.


> 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
>    cpucl1_cmu_info still set `.manual_plls =3D true`.
>    Does that conflict with ACPM firmware managing the CPU PLLs?

I don't know yet what to do with that. I didn't encounter any problems
yet because of this. Is it related to early initialisation only?
I thought that exynos CMU driver doesn't touch PLL clocks after init.

Thanks,
Alexey



