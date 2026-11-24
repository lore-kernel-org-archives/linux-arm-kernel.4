Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65048606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 13:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wy0nOsdm;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=d0QOGZnt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=; b=Wy0nOsdm4noL32ggyafR6cFfxs
	YfRGFplGClIs/u7vcnFXr3x2RkDl6/lg40e/rzRKr0Xkbrx++3OWhof8YjYzzkWW/xG4L5LkUIan2
	dpA9Ri3/h75TnCOBaNYRJ80UghnGaRxkTf50/oxE/NbeCGe3gQPfauB8vHBB1qezmXOrTxrpkv6D2
	zTPIlST95KusK8C4cweQnir+Ec/+HeXEoiUQZqUMT3U30adWT4ksKyeSYy/hNDzCyJJy6eaOZgMVi
	9iG6aCvFwOOzDs8vLhOJGigrHLTAJZRD5zhbuTdiAI1x/yFLTOK1o8xlb53QXRzpCQDVxULR2UAXb
	ZM6q6lAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqQz-00000006cPP-1kwD;
	Tue, 24 Nov 2026 13:19:45 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVqQu-00000006cNP-11La
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 13:19:43 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso5186931a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 05:19:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795526378; cv=none;
        d=google.com; s=arc-20260327;
        b=VpxZYBzqczYk2P1BEiIbb3JsTjpUHVp5iRtsFXN78SOPXhD2P8Pab/6DdDIZXylyIv
         HmOzj3X9gyCL+OAQ58Pnc64Vrw+PikxStuNcKz+Z0qGPalgVTG8ldKoR/GIAoBa+L42J
         aE2RO4/HiYXOe46csXJhpUSZJigzbjX3pmeKtohnr47nFsPY2GtFxNdjo/1L5hZXb/Nt
         NNClArp01wtwGyOc7kDU+EG44ejV9KXpRu3sHgYK+bbKTfmJHPUFPbFVyv0y0nHL+YmB
         EkCvXaVnVbxUCfVpiTYAlFVq67AKYaViaRP6+RLY9Rrojii8EfS5tfml80QyNSdFeE+N
         BOLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        fh=q1aHbO5780jtmZCTlWWKfOHy4ICF273I+Gt+aZN6S1I=;
        b=cpCsGqdN2lwWoes9X3DC4xtM80mel90jyoRLiBT3lt42ELG2U8+Pi6F/3LztypNPWj
         6oJ/YyZtVu5dc40e0o331N8h6+fFVSG62HG793J3kBbGCO0PnAJhXXxmWT4bv4b/jiSn
         GFKs9AbenHEkWjy3cI8iGxcDB6cWYuM54RyS+mAzEA3nuzKpDcxYtKfyPzOs4BOW8auF
         5SJf2Ucgq0CxLCFjXkGqiHQzxthiNEYq1lo4kgdAF4VBecg7KRfLg/G7UhUxZnAfoqmz
         K4Ek6pLASeCDcQMGm4BgHPXn/e25VBTQN9ZswaXWmT4Ivjb9vZMwL1Z/K+tUpBxIJ3q+
         4CaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795526378; x=1796131178; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=d0QOGZnteEjId5WH2IPBLILrJC8mQPqOXqJZvprSDdEmevLK4KfQ1V2n6ZLXVCNb5D
         +UcTBpjcANsCajcwV5TrvZWkIEJ4ykidbr4xIDWHQ7MwqJUSOxCKTZ+bMtqkszv6C5PB
         6Br9m43VgmPU5xgaMCD2J49+1I9uRZepWEdxjrJ8Y9yWUwjs4wkIFDlnH05H50hKHy2q
         DxFt19HTCa4tfVb5gRQi/CF8aKkQ7lNcN4i1J1bgu1Z/byIH0vJca3b1VYOpSz7hStkU
         bGSwPrzafAbphpFynO5ClSiXeyH/wRWOnVM34lVwY6ebmxCkpZBnkcjBeb2fOEAtQ35q
         bR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526378; x=1796131178;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=I1ulVDnQMydRA55SV06KZXVEPk+ELjbN3ZZrUa+XmEo=;
        b=A+MdtmBQymp+1p5rdn1yYyEMb/lHxm+FtV2Njn3MxA3WsmXOexMedJfvhqz0+fPS0F
         ItYFd/UFoqPPKIy/oUF0+cRbqQsBp4LN9DrZDsINOQmovutdHybTGPH7S5el111klvmi
         f1Tv8RZlYAKDz7cOun91uOM921WTNyPpZhM/uIjHTsTQ/Njh+0b5r64MuT9T4hFh1UL3
         AuaYQDGJl37LhO3NUhQTkvigeGXaZyQGmURoDCGmoKraVlqzdZUBRl6Sakd4iA0bPoEo
         j8SXoZN9GC5fpfJQ7JUrGSAIzFpJY+dNB7rHKndouzteCIsxoAcereLDCfZSE0SkMRtA
         pQdg==
X-Forwarded-Encrypted: i=1; AL+hErF4YKRiBSf3AIfcoe2J2gz+hGsif3nVhQd+VUUPWZh1kJ4Ua3UVizXlgGmd638pxtcO/4lCfpoKnC/riBIVweEa@lists.infradead.org
X-Gm-Message-State: APuU4Z/MmYFhWf37i0acY4sWlgDMYqgb5WlrHJIU/SA9IhDYG7yEKTQO
	AY7vAShP8blUwn+f0Uzf2osip0x74TFvn8P9RTMfMSJlZA/47yJ8sEUtQhFctkdXYlKnyfnmQg6
	oVaRsoeJRYwkcf3hQSSr7pCUQz4VQvw06oTBKgzYQRQ==
X-Gm-Gg: AZFdTZekViGaQ6v5YQGbdCgROGA7k2pybSpIiofKNkeAIWX+1Lbtf64NdW9YtBo9oso
	Z7Vjmc2XrzStKZjyQ+yHTOE3nQRYWnVFyVBUkAdOmM6o11QVgiY83a0XeXa59B/7MKcu+AG87KF
	8eFKHnZ+AgpWV6WmL8L6FF0W6uf4AzHJtWJpDtV0pyOhOGsZUSkOeS5g81cqthpLSombrwQ+OEV
	6nNLYsIJ/XSvYMNC7UqQBIY3e3QMCRbQmQAMLgoCGHF6V5Xu0y8Ze+l6C0tGqYhxXzWA62WXEHV
	i5epyakEvVcrk3wRQIaXdl9IATsZJh1/5KaS70JbrBSScgIZuBFtKqBijhU90Qr+IVAHs1WKM91
	MO2b6XsvoOL85VgJieNmOeCCD/2kVGhmrp5wPi7MF3fQ1ogmCmBdXTsEl
X-Received: by 2002:a05:6402:1596:b0:6bb:6c8:c4d2 with SMTP id
 4fb4d7f45d1cf-6bb06c8ce30mr940474a12.31.1795526378188; Tue, 24 Nov 2026
 05:19:38 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026214359.3122870-1-briannorris@chromium.org>
In-Reply-To: <20261026214359.3122870-1-briannorris@chromium.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 24 Nov 2026 13:19:24 +0000
X-Gm-Features: Aa3M54ooVkb3f-H5oJfKOqKUsi4VT1Jkh00xU7wD3yuOn0cj9WC5t6c3w4KgoWc
Message-ID: <CADrjBPojS5tSJw+7E99AYec6NY46QLcM6iv=i3xodNJvvxKJRg@mail.gmail.com>
Subject: Re: [PATCH 0/9] google: Add support for Laguna CPM
To: Brian Norris <briannorris@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>, 
	linux-arm-kernel@lists.infradead.org, 
	Mariano Marciello <mmarciello@google.com>, Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org, 
	=?UTF-8?Q?Jakub_G=C5=82owacki?= <jglow@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_051940_929867_1B889882 
X-CRM114-Status: GOOD (  23.86  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Brian,

On Mon, 26 Oct 2026 at 21:45, Brian Norris <briannorris@chromium.org> wrote:
>
> The Central Power Manager (CPM) is a co-processor on the Google Tensor
> SoCs, as used on Pixel phones. CPM supports power-management and a
> number of other features.
>
> The Application Processor communicates with CPM over a pair of mailbox
> channels. CPM provides clock, power-domain, reset, and interrupt
> services.
>
> This series adds device tree bindings, DTS, and drivers to support CPM,
> and several of the basic services provided by CPM. These services are a
> minimal set needed to bootstrap many other components on the SoC --
> e.g., I have a working proof-of-concept PCIe driver running on top of
> this series + pinctrl (not included here). CPM provides some other
> components not yet included in this series (e.g., PMIC, RTC).
>
> This series depends on the bindings and mailbox-payload-definitions from
> this series:
>
>   https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
>   [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver
>
> So this series cannot be applied as-is yet. However, v1 of that series
> was under review for about 3 months, so I'd like to at least:
>
>   1) demonstrate its clients (this came up at
>      https://lore.kernel.org/all/CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com/,
>      for one); and
>
>   2) start review for anything that isn't significantly impacted by
>      potential changes in the above mailbox series.
>
> With luck, the general design and DT bindings don't need to change, but
> even if so, I expect any changes should not significantly affect:
>
>  (a) the CPM DT binding or DTS (apart from #mbox-cells)
>
>  (b) the CPM interface (cpm_request_client(), cpm_send_message())
>
>  (c) any of the CPM clients (irqchip, reset, clk, pmdomain)
>
> Thus, I think this falls somewhere between "PATCH" and "RFC".
>
> This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
> as-is (plus the aforementioned mailbox patches), and also with minimal
> additional local patches to get other components running on top
> (pinctrl, PCIe, RTC), to prove out some more realistic use cases.
>
> - Brian

FWIW, I tested this series, plus Doug's mailbox series on my Blazer
and Frankel devices. It was enough to see USB come to life as a gadget
using the already in-tree tensor USB glue and phy drivers (see patch
here https://gitlab.com/LinaroLtd/googlelt/linuxlt/-/commit/b7866f74743fd6828036bae570ca6d022e23c4ff)

Tested-by: Peter Griffin <peter.griffin@linaro.org> (Blazer/Frankel)

Regarding merging the dts/dtsi (arch/arm64/boot/dts/google) and
(drivers/soc/google) parts can go via my Tensor SoC tree. We will
likely need an immutable branch for driver/soc/google part to base the
other drivers off.

regards,

Peter

