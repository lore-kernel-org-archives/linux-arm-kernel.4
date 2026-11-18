Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F650606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 08:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FR7UV2Q/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T7l0I5Ut
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W34DDB2cLnsAExSKGg1C86iBQOL5I+MWli8p7NMuBbs=; b=FR7UV2Q/4oJLhW
	1ApqGpADCfreoP3qye0DFyIEbA7KBWZ2sGShfnNXrXcX9EVzqtxYfOq1BBZ6Ye0YU3EP2vFIl5tkL
	bNdr/NggyC3DPHAfzrnNrdxQUttYBpzs95IqZKaNmNDG/efZy3VsfLr5riu7SDPrUdzoUfzdG8MMj
	NtjVFm+h5Gq4NqLSGI3oBjJ0zMrGPG835FvkOv/Lr9v2wyxu7s954FC4ZZAV3kA/RZVBiLurt+ynw
	zY7F256A+44b/nip6k9j4dPEUwT5EioLzSnE733H/CExwlUk3Vm/lCcI3zzRuZVgFWDyu3wuZs3MW
	c61hXQh5M7srRMKWqO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaxS-00000008AeW-0kaW;
	Wed, 18 Nov 2026 08:23:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTaxR-00000008AeJ-1ka0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 08:23:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD9A040111;
	Wed, 18 Nov 2026 08:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A84D1F000C4;
	Wed, 18 Nov 2026 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990236;
	bh=W34DDB2cLnsAExSKGg1C86iBQOL5I+MWli8p7NMuBbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=T7l0I5UtBLZnK2lk3AF7CxS691KFZVgFUzzAPZy8+aDGgoY1Eqg2ON+PtbMrOW6WX
	 glYV6pPkUQc4SNPZjJrnZRJc4x3O1vXciX7pKs61CFGS0feijmNChr6C4L2omWHDN3
	 pE7+Iph73a6OVRBC40p6jtkSkz/Rx/0Vt0vyEZ9snHls1EXA8I+Z1fYKSUuMjU5Wue
	 1CopnkXs6qfUk3ICvFi4umn071UZ+0yfmOCn1cH/IJmniGAsQvPE+iLN/wMpKTtXdb
	 cstPbKCQZNVDc1KVmVtFl/fBISEj4ATrzZs9LhfkGcFmur5FeXQf50Ed82E9tWLUgC
	 A0aN6XIixOJyg==
Message-ID: <27677095-4f84-453b-934e-4451d8c549c6@kernel.org>
Date: Wed, 18 Nov 2026 09:23:48 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Raghav Sharma <raghav.s@samsung.com>, s.nawrocki@samsung.com,
 cw00.choi@samsung.com, alim.akhtar@samsung.com, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
 conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 is.gandhi@samsung.com, ts.amit@samsung.com, pokala.reddy@samsung.com
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com>
 <a7b901f4-59d1-4671-bfed-0d11f9e505e2@kernel.org>
 <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CADrjBPpecGbRo2PhH_zqGfNf3L=bNf81q3SMXnSvD2n0Lx-cbA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 16/11/2026 19:06, Peter Griffin wrote:
> Hi Krzysztof,
> 
> On Mon, 16 Nov 2026 at 10:02, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 13/11/2026 12:05, Raghav Sharma wrote:
>>> This patch series adds clock support for below blocks
>>> found in Exynos8855 SoC
>>> TOP & PERIC
>>> PERIS
>>> HSI
>>> USB
>>> There are many other blocks, for which the support will be
>>> added in a forthcoming patch series.
>>> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
>>> ---
>>
>>
>> Thanks, entire set applied (even if b4 thank-you letters show partial).
>> for-next will be updated later today after builds.
>>
> 
> Just FYI, there were a couple of outstanding review points on this series.
> https://lore.kernel.org/lkml/CADrjBPoR7_LDZmxC_bOFigvqDaagVihmybfX5AdvSPr9-FVb8w@mail.gmail.com/
> https://lore.kernel.org/lkml/CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com/
> https://lore.kernel.org/lkml/CADrjBPoAVMdxgU4P+shh+9O5rGJp+m3sRQMDd2c-7zbJ8qhiBQ@mail.gmail.com/
> 
> I guess the main thing that would be intrusive to fix in a follow up
> patch was introducing a slightly different naming scheme (compared to
> most existing Exynos SoCs). The clock names being
> "gout_<IP-clock_name>-<block-name>" as opposed to
> "gout_<block-name>_<IP-clock-name>" that we have for many SoCs. That
> also applies to the dt-bindings header "CLK_GOUT_WDT0_PERIS" not
> "CLK_GOUT_PERIS_WDT0" etc.

Oh, I completely missed these. I'll drop the series.

Best regards,
Krzysztof

