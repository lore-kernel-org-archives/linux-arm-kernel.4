Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324D5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jgfk2FCh;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dAPFCSFo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=; b=Jgfk2FChzsqUPt
	6eg3tovIk8JLeiJuz0Y3jw3DoeShzl333shMVzSTmJiv6D7KNBnuwJwGA/jYf5iq5Hj0G7ofVh9xq
	OXvOano37CulrYOdQYufkz0061lcWCWpAI/J9d9zGoZ9NykxA+O+RhgpxDeZaZnr0Kscf/Y5NoDs2
	hsheRS/QgD4iO04CHFVhw04480DmujK+G76Ao+mjgS38IStox4AvYffjkx7MtTuuOs+cyuVsatM2i
	GYKpBmkhLzplmXAFkVr7PcMP5Xii9rrFGCwIJqf+sUsByN2Osf2PfCGmSu1JCa6QI3bNILSbi85Ly
	ssNNgim1P+rQI9MmWyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzcK-00000003EL8-0UuU;
	Mon, 16 Nov 2026 16:31:40 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzcH-00000003EK0-1zsi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:31:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so12024095e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794846694; x=1795451494; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
        b=dAPFCSFoE9yVtmi+to2WLI6aEExCmb5/M/hjTnmJBONjOSu0BNoLwt5SVHj6zPOsJR
         TjyUsEn+Buf9gz26Q2pGUEi8eFkQgsUJh+tyRdw340/erDdpf0HSuswZql+QNTRmy9Z7
         wIPElAax1XQsUpK1Wg3Q2XHEBrChHneZrlDzicOyZ+S8ipjBdapgbU6V6qG7cA4WCsgb
         5Jw1LsPk0pWwReviohQymeAwTh3k6jjJdYg62lV7aEmEDdseY+ZiARrV2j44nuofOatN
         oivULEAmRZ/fquJXwnmRMMIFzg0g+HciyAFMOKvd/GCgcrUofqglY6gNwsJVvA2thJk8
         +MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846694; x=1795451494;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGmDTpXlmeRKF3X1XvVcrYHV2kv2B7zOq1c5EiYOh2I=;
        b=hYdqchjdlYv5ptjaIWYAeHW3+ik2Sb+AVzduMcVOPDj+KFj5M2d1ky6jWTYuykIAeP
         Gy+iivtWqhrWai8BuINRSctxzRPVU8tiNYkHMQjsiQqq0DpjR+EZhHw6mdh/Du2h2wym
         08NZSel0f1/CCtAxYkIL1XiIk2OwdZ7CDLbdQLcew7TRnMVA5RuDfQaoJqizPyfb3nGB
         S8CQhYcc+qAEeiwrqwLuvI87Y3ppZk/eg9tkUfUohh1DbhbgwIdlViSf3JTlA85Cwnn8
         WZlN8SFZ29/gPbfhzzKURHqihbXjEqYEOkbmI4WvxGEIwPabk7qknXyHw6CguBlBkPqT
         vPiw==
X-Forwarded-Encrypted: i=1; AL+hErHjmaWd5z10saKTE3RZsQP2VewTAuH/n1lhF2l0xkbpk97mRE3Nhq6SQTuaA536aYwC4HOl/zu/vEljjAbpFa1k@lists.infradead.org
X-Gm-Message-State: APuU4Z/4Nj6kVqOhyrFSB1RzCOR6C88GyeGfHazfKaQK65nmFHKYgTpr
	mSGp7Wh8vsV9UE/IrURSyC7/CoRIwbInul9Cjnm386MlOtZUdc3AK3IPsEeoxBDsErg=
X-Gm-Gg: AYBFou2l4ZRWOv2IKC6V+jOBsNoYHAlupFkJlZ89LVni4Jo0v/k5vFHVKWpZFMwQtus
	LNI90JGmd53Mb74TPOkxpIpYG9Dx7YavGUtZx02qvZFeeaaF3ltNdhbHi2pXIQFCBz+FGGhJ3tU
	vwVsq7E1TMT2M/uYhHW8hgl/ZYn5XcLFxb8KfoVOfsD6x81IwZ9/2QJbUIDcax1BC5XtkT3RjdF
	00WB/M8OKNTu47vVDwQXYK0vpqvkxbMBiVjbPsdwOZnbmqkIUb6q3Ie8+d8AcI0jkh4/3Vg++jp
	cyBlrCodlfinomi5Ud5JAuDsyPxKFDRd4ic/st8jjm7XZ7N62nmEOuKBsW4++rmUXMpoyxEMgi5
	QNahSkeglg98ICrl9uBNZvTx7PByo2aNQiohZRKl+HlQHsePB1eikRGuQoVFFCnOapDZ1hcsptu
	wp0F8ySNJ7EI45NUYy9t2a6tACtPGb/OfBOTG5cD4mQb/cH99INdnS0pUd3FaUv/qPdGVepq1um
	kofejc5liqsZMcQirp0tanfIC6BhMmV2j9QIwFqlllxnGgPpc2FAQ0NmFKGG0fyVhOFL6XRi5io
	wtF5poGJoSmzCTynTqFBxYqWlkxyBt66BLXrBmlmM7AptMlPGX+O3gCJteJcJt5KOjnvK79c8Um
	SESgnZPH84XvGv9xp/8c=
X-Received: by 2002:a05:600c:3114:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb55a5de41mr233741175e9.21.1794846694305;
        Mon, 16 Nov 2026 08:31:34 -0800 (PST)
Received: from localhost ([2a00:2381:fd67:101:bb28:8e5a:f94b:4332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78385508sm242715e9.3.2026.11.16.08.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:31:32 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 16:31:30 +0000
Message-Id: <DMWS1URVNP4I.99T9QR6VWAUW@linaro.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>, "Thomas Turner"
 <tturner@lineageos.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Juan Yescas" <jyescas@google.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Peter Griffin" <peter.griffin@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org> <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org> <8e305a3a-c30d-4862-9da4-8c763b9f88a0@linaro.org> <DMS1ELJMVBTB.2I2J926XE5V3S@linaro.org> <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
In-Reply-To: <CADrjBPq79Dn5pv-2wdcG5b9rNb4NHatzGGZMrfAkF1L0ZD1mHQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083137_562745_5FE02056 
X-CRM114-Status: GOOD (  37.37  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Peter,

On Fri Nov 13, 2026 at 4:46 PM GMT, Peter Griffin wrote:
> Hi Alexey,
>
>> >> Eventually to have some sensible/working ->recalc_rate() for ACPM
>> >> cpucl{0,1} clocks.
>> >>
>> >> Which is needed, for instance, for cpufreq_dt because it registers wi=
th:
>> >>
>> >> static struct cpufreq_driver dt_cpufreq_driver =3D {
>> >>         .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
>> >>                  CPUFREQ_IS_COOLING_DEV,
>> >>
>> >> Don't know if it answers the question (if I understood it correctly)?
>> >>
>> >
>> > Thanks, Alexey. I see now that clk-acpm.c uses pdata.fw_name on the
>> > parent (acpm_ipc) DT node to link the ACPM clocks to the CMU PLLs for
>> > ->recalc_rate(). Could you please clarify a few things in the commit
>> > message (and below):
>>
>> Thanks for the good questions. You hit the exact pain points we have bee=
n
>> debugging on hardware with cpufreq-dt and Panfrost devfreq.
>>
>> > 1. Physically, CLK_FOUT_CPUCL{0,1}_PLL are not input clocks feeding th=
e
>> >    APM hardware, they are the PLLs that ACPM reconfigures behind the
>> >    scenes. Meanwhile, acpm_clk_register() sets num_parents =3D 1 and
>> >    pdata.fw_name =3D name for all 9 clocks in exynos850_acpm_clks[].
>> >    Since the DT node only lists "cpucl0" and "cpucl1", won't the other
>> >    7 ACPM clocks (mif, int, g3d, aud, cam, disp, cp) remain permanentl=
y
>> >    orphaned in CCF with rate =3D 0?
>>
>> Correct. Is it a problem now since there are no "clients" or consumers o=
r
>> users of these clocks?
>>
>> Or do you suggest to link them all to parents clocks to have a sensible
>> rate?
>
> Since your implementation relies on CCF to get the clock rates I think
> you have two options:
> 1) Only register ACPM clocks that have a corresponding CCF implementation=
.
> 2) Add the missing CCF clocks for the ACPM clocks you are registerring

Well, if there are other suggestions to implement these clocks without
relying on clock framework, then feel free to share.

Current implementation does indeed registers all clocks from
exynos850_acpm_clks[] and the ones not listed in DT will have no
parents, no rates, with no_connection_id and no users+usage.

Since it seems to be a problem, okay I will fix it.

> Should CCF's ability to set the rate for these ACPM-managed clocks
> also be restricted? It seems undesirable to have two entities (Linux
> and ACPM) able to set the clock rate, with the possible exception of
> it being useful for debugging. These limitations should also be
> clearly mentioned in the commit message or cover letter.

Ideally yes.

>> > 2. Does bypass_acpm_exynos850_get_rate() actually return the updated r=
ate
>> >    after clk_set_rate()? When ACPM changes the PLL frequency via IPC,
>> >    CCF is unaware that the parent clock (fout_cpucl0_pll) changed in
>> >    hardware. Even with CLK_GET_RATE_NOCACHE on the ACPM clock,
>> >    __clk_recalc_rates() only reads the cached core->parent->rate witho=
ut
>> >    calling ->recalc_rate() on the parent itself. Won't parent_rate rem=
ain
>> >    stuck at the initial boot frequency?
>>
>> This was already asked and seems there are no answers. The problem with
>> stale rate is present.
>> https://lore.kernel.org/linux-samsung-soc/DLAZXSNZK6QC.1VFAX37XCXBOV@lin=
aro.org/
>
> The question was sent on September 9th, but the series adding support
> into ACPM was sent on September 15th
> (https://lore.kernel.org/lkml/20260915-exynos850-acpm-clk-v2-0-ffad4a6b3f=
b1@linaro.org/).
> The limitation about get_rate returning stale values should have been
> clearly stated in the cover letter or commit messages.

It is a fair point on documenting this in the commit message =E2=80=94
but the gravity of the problem and its consequences were understood quite
recently (you should be aware about that). At the time v2 was sent,
initial testing only exercised one-way rate transitions which appeared to
work, so the full impact of the stale rate wasn't apparent until more
detailed DVFS testing later on. The problems with stale rate were
initially discussed way before September.

>> Any suggestions?
>
> For the benefit of the ML, we discussed this topic off list. The
> consensus was to try and make CCF walk the clock tree, recalculating
> clock rates from the SFRs without using any cached values (as ACPM
> could have changed the SFRs of PLLs, dividers, etc., behind Linux's
> back).
>
> That should in theory mean that clk_summary will always report the
> correct clock rates for everything in the clock tree and we won't
> report (or make decisions) based on stale values.

I'll re-implement and re-send.

>> > 3. In drivers/clk/samsung/clk-exynos850.c, cpucl0_cmu_info and
>> >    cpucl1_cmu_info still set `.manual_plls =3D true`.
>> >    Does that conflict with ACPM firmware managing the CPU PLLs?
>>
>> I don't know yet what to do with that. I didn't encounter any problems
>> yet because of this. Is it related to early initialisation only?
>> I thought that exynos CMU driver doesn't touch PLL clocks after init.
>
> You should check this with downstream sources and the TRM.

Erm, I don't think this question relates to downstream unless I am
missing something.

BR,
Alexey.

