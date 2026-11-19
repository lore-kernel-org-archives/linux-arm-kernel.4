Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD12606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H4CXgSGv;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=n3S4YCEd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=; b=H4CXgSGvDgF0kE
	XumAzABSUYP5FErFEMg4L3Ef4HTyIB5QDG/2Fw3k++cl4N437W/E0fCbghu2dt08jonrlvWsYIcDm
	/Mfwci4VNnIWqURGtuprQaytAs8FVmjAjSt6PYdQ1GFaAxaOdvv28wMMU5THVNqYYLIIr/I4bEvq+
	xps1waicbAipZIPj8VrTZyjBz150DEiPTXOmk0a6hi30rfNsVTQheJQqQfcxF42hJbZOAUcumZ5rj
	PBXRo3p/OrLJOurF563C1fp03xdkmsgPKfnkOo3GQ3sEGx7T6FWPCnU6uX2PXuzH6zvExfRYuyNhp
	NJB8GSLeVwB5PzTFoJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Q3-0000000CH0W-0XCS;
	Thu, 19 Nov 2026 14:47:23 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3Pz-0000000CGyw-33l6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 14:47:22 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso659253a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795099637; x=1795704437; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=n3S4YCEd4lYdOH4DbnA99ZPhymyuf8E1OaC3d8wZNEaUZpoykHaIPO2nUIaERtS2TS
         J3PYRmc4krRKt0LwxbrXmicQjRXcHfhSMh8nWeqiP8PJycSQW48bT/WfilUGrMVjLFGX
         RoUm+dQMTw8ugibLyBdXRmyUxanPKrR4PTSqLKjmSANrf/pODip3SVwpMaFkk8EPYOdm
         my/SiKL0VP8f0IKjhw1DG0HbI/dYhKbOBIJg4P9klGWilkV3fNuXNOdNK5IfSeHOnD1t
         jtWhSAzvttlhaG9GXkdf4yPMH9TYSwwqG2yTtRb9hUl9QJ3SIhShdfS3hn92RMkAciwI
         Rk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099637; x=1795704437;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vITMaRYl8N/4FX6Ub/CtOdFIyxibL9pIfaPhRC74PEQ=;
        b=cPKVGIdaoNdyIJSDB2zOKoem6/0iZ7uWtegOSmF8abXKTvVZdPeeJA2nPwpI2Qf1j9
         EsS+1+6eaf++fT7N10F2sog0jvWQd+8UQMN5DRLbSJ33kIA1hRho2TWGhRg4gHRxJjhg
         CPSwzwFIgDvPdC1Xbwk65ka9yTC57WG3Dr6pN8zzrFVuvFvpyp3JyZ4oOZpf7yvf767/
         yYurP/nEm/oIwWf/7J+ORKajEz/0c1Mb4X62NrXG86cfkOAyq1K6rFQerbxImE5AR0ri
         V6gt7caQ/TdKXIq25QcnmQpvXRbjvmkffvDrFZk2V4yiYEvTuLJ/8sZ1+YMGmxCD8qG+
         k83A==
X-Forwarded-Encrypted: i=1; AL+hErH2t1//yjgt7QUZfJFDRMeXdkBwt0Z6C7ZTfliPv4Uj83ysEHDBQE5C92t7vu6NF70FFVfsnNw/rokZcbpt+Gtn@lists.infradead.org
X-Gm-Message-State: APuU4Z+11yEBfDu1n+7Pls36OuAjPd9ntNINDeHnvj6urO6oWks4g4if
	/GOtP1/oPSFzfPCSrX6qe8541woDtXHt6puiDUkmdOjG1MkaO+HjaZRUQ6n3Jr5TC5I=
X-Gm-Gg: AYBFou3sL9Tq3iYgte3RQfOpEYACG9s+e0FY3L9XpxpRR0Kge3CSUVTHxnBPxrrKwF4
	a9yF/xC6kh+3BPy6SFtuZuBYgJJd4SJz/F5mB6vltTQbMm7Ch2T8xgtFWwdJ8Vh4N2mC99M4DWn
	7cY+TVt1WK16VFcJuSlhvGvzshlK7Kot3zX35gkhrDjZ5kzDrHGrbT+ExiNdDicj61HdugQjG1j
	Ek1XzkXclTJxQLEx1LerwbN2WyNMfaayX6fg0G4fEJNYxu8uVzt11Y3dZpSWXJChL7bO159WUgz
	sGl5xQGb7ZcMW4xxZ9xCaPqvBdsh43Fzvk2vnXEOYDFbPwExStKbJAm4NR+Y89PoU22VV3qhVOh
	IpYP/2WBJ1xdSgT4xQvaiVFu8RaM7tl3nTLEV+a/fjlOP10npay4TlNOXbeDNp7DNYLww40IQph
	rdnyTwHUMWSeGrzyNjU/jS10/BbaaH/j3ruszzmybZ6Pdwc+V45JKxBJ/yhTO5+zeJwTXnIBL2d
	Po2+31Iyhbg7ACPTIj/wN6eGzlCUHrF2hju91LBrbpq38YeS809N+i+SMjrf7Z5TG1JLMak9+au
	fMr94TpDyESpalwYyX8CFcOleEwYEYxqiAa32t8tg9qjJWfua0h+hDTPZw==
X-Received: by 2002:aa7:c7d5:0:b0:6b6:ea98:2539 with SMTP id 4fb4d7f45d1cf-6b9095b57admr2564430a12.6.1795099637250;
        Thu, 19 Nov 2026 06:47:17 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993e08csm2579854a12.6.2026.11.19.06.47.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 06:47:16 -0800 (PST)
Message-ID: <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
Date: Thu, 19 Nov 2026 15:47:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Autocrypt: addr=clegoffic@baylibre.com; keydata=
 xjMEafx9bxYJKwYBBAHaRw8BAQdAtc85GIwDXLz0rh9thWXC80Lji0otVDVncXT4qaS4j1fN
 K0Nsw6ltZW50IExlIEdvZmZpYyA8Y2xlZ29mZmljQGJheWxpYnJlLmNvbT7ClgQTFgoAPhYh
 BJjMiHuM4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsDBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEH6EW4KtCh6Tt+sA/jVC35rY1npFlOy7YnncTdrID8Qf855JA78IzXgvzpGp
 AP9FkuuT80m66PP3DvgYX9kVnG17mSDKO0+v2W18v6ZgCM44BGn8fW8SCisGAQQBl1UBBQEB
 B0DMwF4u//aQyzsFlO8rPJ/cqsAuPH80IeIA3HOEo5mlVgMBCAfCfgQYFgoAJhYhBJjMiHuM
 4ZUwFqUPr36EW4KtCh6TBQJp/H1vAhsMBQkJZgGAAAoJEH6EW4KtCh6TdSgBAMDS0MiWCivt
 LjzZc9bs+P/xdXywUjDKq3lpQGJ6vZ0GAP9vI6DnN7vwVK6jt6/+0aBGkog5Ura9+WwRFEdM
 vLfPDQ==
In-Reply-To: <cover.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_064720_130096_DD144EE8 
X-CRM114-Status: GOOD (  15.76  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Geert,

On 11/18/26 8:44 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> TL;DR:
> 
>     Describe hardware in DT, and perform mapping to abstractions offered
>     by SCMI in Linux.

A question on the approach
An SCMI variant DT could mark the CPG and MDLC status = "reserved" and point the consumers at arm,scmi, while the U-Boot IPL keeps the hardware DT.
Since v4, the series assumes the SCMI ids are stable:

>   - Remove dependencies by making assumptions and dropping disputed
>     items, to move this series forward:
>       - Assume all SCMI IDs are stable.
If they are, why not using them in the DT directly?

On partitioning, the cover letter says:

>   - The clock, reset, and power domain IDs are not stable by design,
>     causing DT incompatibilities.
>     SCMI requires that the ID space exposed to an agent (i.e. Linux)
>     starts at zero and is contiguous.  Hence any change in system
>     partitioning (Application CPU core vs. Realtime CPU core,
>     virtualization, ...) may mean a renumbering of all SCMI IDs,
>     implying a massive change to the DT.

SCMI do not mandate that renumbering. The ids start at zero and are sequential, but nothing requires them to cover only the resources of one agent.
The firmware can keep a single id space for all agents and restrict per agent what each one may use, the rest returning DENIED (SCMI 4.0, section 3.2.1).
For virtualization, the spec has the hypervisor grant each VM its resources this way. A new VM then changes permissions, not ids.

With a single id space, a software configuration only changes which nodes are enabled, so one DT per software configuration, a base DT plus an overlay, is enough.
If managing many configurations ever becomes a nightmare, tools exist for it, such as Lopper from devicetree-org [1], which generate one DT per execution domain from a single system DT.

That leaves the missing clock domain, which is a gap in SCMI itself.

[1] https://github.com/devicetree-org/lopper

Best regards,
Clément

