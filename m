Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B03A606A327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 00:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gAsWxIKV;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPs+OaY5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=; b=gAsWxIKVN/fJtwUh8XAhKWd2Ee
	XCjjqyyrcT6BpprEbf+tN/UO7aQ9XK9riD7pjvlnGnvYtQUG6N4Ur7Cdrr5tpesqkN48DfggyH4pn
	gqTLU10zDWSpuffPCRFox3E3liHv/e+yyRBPwtYm4DtKW7lOHL2hcuJtGtFPLPMjepat9yEpcW90n
	dQo6FKxIvN+ilrUrDl+ZwXcLEhgVLXtdz6LJzGn7mQSoihSGXYyzCoQGpJifL0y9T5v7DDWieCnSf
	E4Kt6BuojCJNJ2lOCgaxLEXevAgBsTs2YqzZjokVmqyF1bR5PICxzzKTIxeTKFKhX1kGut+Do86TP
	rTE8U5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOVm-0000000GwJx-2pu2;
	Sun, 15 Nov 2026 00:54:26 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOVi-0000000GwJF-3CyT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 00:54:24 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1a3c08d6928so3035032c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Nov 2026 16:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704061; x=1795308861; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=YPs+OaY5t7hwUWnOOLi1oeBcXCNfdK7ZCbCiYq5xwOuQaxGv0PBGt2vX7tHMZ8WDOK
         o5vKyCjSwwqiCoDzpMcJ94rVxyix1bZGaixC/ndqNqkq9NbPl6nZr/qDZ4omyUNWfK4n
         ftO5WZl3slqzTWhW9cFD1zl0lFKyD25HzGZGIxPrLOJ6moYKVO8UqTtQHbq+sRqkTP62
         3B/qOmNfAyRbuEVBjB2Et+7iDsLV0htASif0bXGkUPvq4nEUUF5UqoWfVi6L0wFPCZf7
         iCzs9pygKULkYQcLp2ie4kCAyUqXTtB0dBF4111CSBnD8H/GGl5V6fxV0TrztgHqxl64
         mv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704061; x=1795308861;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wom25+2wqiUds1POyI+eHp228E/IXzic3h0qgPh6IYw=;
        b=JHgR1OsiC2GI6RKVdBL7Y885mIx/LJ/9HLq4dr3GoOMLxErNp5dbjxdHx3pXKBFYRp
         7PH7Mt8k/V15xkiMZrWEtXOGE01IFc5dilldkh/VPyHQ5CSsfMcAx/UkaZkJi3f5Fnmf
         +3DZmyC+mij4Pb+ZnCWrDBfSvmsvdvl5/idvJuPzxvuf3JRjh2WoWPlbCNtFPAZejGko
         B13DM6AH2NV52OUXtclnLrRfLeuxIhLnUzNd+J1FPct8c99weTMWD+9pBARLlhXIbO4f
         93L6edq8hac/l1OgCkDKsemkrNNJbod9m1B8qD0GjsYhpDITEAnisUoIUKbAmc/PAlKn
         R+hQ==
X-Forwarded-Encrypted: i=1; AL+hErEXTh9mu1icqbOVJVP14YuMGF8U98FHkwmSAFh8AZuCHGyB9PWGGnZ81qAhHSSp6MlAf4B9I/VgNjmEhjW6rvpd@lists.infradead.org
X-Gm-Message-State: APuU4Z+c/GdJGEQBV8TebPnjr7yu24DjzOs0bk1350Su3ZtZ6GCF2VVf
	n+mPrprNcVa7VeKDxPcVQul8PGl4sVFeUjkfquwXewd5+urXCcoY8UcZGlF1xw+fgDk=
X-Gm-Gg: AYBFou1Dvb1nMW+h/8ehyjxMOEy+8oWhFz7iy9CYaEcJoXZg14Ll7BnmaNISf6ZuTvz
	YcK6jfPNpKocUY+RwJM4BQlSHZOrwPJHkH28/wT71098KL1BSkV+ofvZqcq7PfyTiFU7kqQ7ZQR
	upAnJdo38H2adX9F3qo6YVtc0bRrNrJe3NR3vgC+LVZtMoaRoEuXKVtyru6UMQgNsUrIOwzasrw
	eTYhxuxxvhN5Aj0Dt2TLWCqDW4XDQrvPxYQ8HW11kNf1thJIql4FmD4oLiQJxq7Rr58Ee/6nqkC
	2AQ6wwi0SZ+T2AkcaIt81HtkFIkIulNfx7e9ZSS4OLLmn7+CSqqxBBttlInBtTW5bEiIlHejD4d
	y83pqc7x/8feC1UcpVZa1i65sfi65XbuR93ox9tCSo69FuxbAnZdfZS1WN7xnv44dDZn/Fma7PH
	GxeAt2i9QOb0A3Mq691GryMkidye1CjwMrEhRJj0jIIS+x0KXXJU4RJ1nitUJrUL5XyrBdqcBN3
	/Ysd5RBNh1jX1eU8pvbbG5RdrFO/GICRW/D1a8ewBIUlEu2fuQeutaVGJ2ugbWc+DphOjPSF3C/
	RSMlGH6/7UuUfvHo7VLWG+phBW+r1tA6rJRZ0PtFK5O13wAHvBKBGCV75jLOmnLwrt4=
X-Received: by 2002:a05:701b:2706:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1b503120981mr6267107c88.46.1794704060898;
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm29598546c88.3.2026.11.14.16.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:54:20 -0800 (PST)
Message-ID: <9c1a915b-dbf5-44d9-88eb-680449348dcd@gmail.com>
Date: Sun, 15 Nov 2026 09:54:15 +0900
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] PM / devfreq: rockchip-dfi: add NO_INTERRUPT perf
 capability
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-rockchip-dfi-cleanup-v2-0-43ff34ac8599@collabora.com>
 <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-rockchip-dfi-cleanup-v2-4-43ff34ac8599@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_165422_823212_3F43681E 
X-CRM114-Status: GOOD (  24.43  )
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
Reply-To: chanwoo@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 9/22/2026 5:32 AM, Sebastian Reichel wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> The perf subsystem's PERF_PMU_CAP_NO_INTERRUPT is a bit of a
> misnomer.[1] Instead of meaning that the PMU has no interrupt, it
> actually means that the PMU does support sampling. On CPU PMUs, this is
> equivalent to not having an interrupt, but for uncore PMUs like the
> rockchip-dfi PMU is, no meaningful sample data could ever be generated
> regardless of whether or not there is an interrupt, as it is not a CPU.
> 
> Since rockchip-dfi doesn't seem to make use of the interrupt the DT
> provides it with anyway, this was probably never a confusion that
> existed in this case; the capability flag was likely just forgotten.
> 
> Add PERF_PMU_CAP_NO_INTERRUPT to the set flags for the pmu struct's
> capabilities member, so that the perf core knows about this limitation.
> 
> Fixes: 4d586b5724d3 ("PM / devfreq: rockchip-dfi: Add perf support")
> Link: https://lore.kernel.org/all/20250619140442.GH1613376@noisy.programming.kicks-ass.net/ [1]
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 5339616f7ca6..dd9edfd6a674 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -646,7 +646,7 @@ static int rockchip_ddr_perf_init(struct rockchip_dfi *dfi)
>  	seqlock_init(&dfi->count_seqlock);
>  
>  	pmu->module = THIS_MODULE;
> -	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE;
> +	pmu->capabilities = PERF_PMU_CAP_NO_EXCLUDE | PERF_PMU_CAP_NO_INTERRUPT;
>  	pmu->task_ctx_nr = perf_invalid_context;
>  	pmu->attr_groups = attr_groups;
>  	pmu->event_init  = rockchip_ddr_perf_event_init;
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics

