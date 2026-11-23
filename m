Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A354606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 16:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FYG/71tU;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=FSRxI5Gu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=; b=FYG/71tUEPN5rt
	tSigJAgfUCeTz5bLHGwp0Rde4DJ363vwEVw2f0lC2FgAcYvNBYrz2b58BJgv23JJmtfTmpRqA3zRi
	OQMwaPMO0suD+LWFrI/QS3GftwwVdsCJ3K+LOc2t84doe6xHHj051Na2rxuXy/ZKiAdPKjYDloU9+
	YQpBGggLxbBfkD30Ii4xHtsvckQs0hVtMBFznRqsfhajQTZPG7l3r8WbheV1X1T+HwhE5KpMGU+ts
	QMYdtKTazc6DqEVzqAb+zRA6oQcd/f55y4erJ7SqHqG72qDbI8EuKwALXb8lG9iGl/QL8dd9ItMhz
	2FgvqrDcyoJyOJisNcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWFr-000000044Fr-07gB;
	Mon, 23 Nov 2026 15:46:55 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVWFo-000000044FA-1FBA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:46:53 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a210470b49so33393865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795448810; x=1796053610; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
        b=FSRxI5GuzCaC4YfY5/n5uRx9makYbRoi6C3H/filn8KkoDvItvaalZPWNm9oj720H3
         npkJH/7L+p8gNM3vtCIV4upaeb1Bu8Ldn0xJRDJzVlPiKMIUcR3E/Lb+cwXigCjCJP7S
         KPyRjcrL0w/Z3F8wHxN+StXts1JRf1FGV0gvD7sWzKG5npRGy2Y/cc6R/+luFVdxILpN
         mhc/wicQmS0g72BzYVfawj07z1AdMUkLgRN2RlgPxmjFcxdA5mpIGaQJM0zy0W/6YQTp
         sHYXSQvlGHE6kTJCViDndxEIk1QaRWA0UrLVfL8jjy8qrTd0Q/BnMDnjVb00r3Mf2QOv
         urQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448810; x=1796053610;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jco5N9HqUZU5bQiDb/7CVG3Xd5xNAy5U7XJ/rBLzfGA=;
        b=eRmFecnDUD7jAk3MIkLK0WUrdEyKekcTr2HqSJDjZgtRts66+z7zORejLzWeeR2lHI
         YQpfyhT4OURSDmWwXWilPq8WjpPnDgVkZ3Zxjbryu2z7RZKhqUNhhpEm2QAhnQIXxuUu
         2OqRyuxliG3IhfkIISiCW2HcwTrjCxjyqQn0qYfgq65nG1Iz+cU5qEwpgZ8BbBU+Ti9V
         OB1MjVcboBE2o0ogAolfG2wkF4C5MAz+oxzk1mSjQdX/ohqCSsCf2Z/gK1BEdBwkYdf1
         RaMqqrQp3BOmd866U1VJ0xtjfn+gvQ7b25xS6bOFiJy8Cindt3pI2+blEoyeXDppcGzc
         9QBQ==
X-Forwarded-Encrypted: i=1; AL+hErGzPuAwSXZUnwtw0yf2amND9mIXNbZhsDoraFOyHZhlpvizFPfYAFqlxFza6+JqewGkkK5Gb14ZRebW+I7MpMre@lists.infradead.org
X-Gm-Message-State: APuU4Z/4ymyo7lYBOnhrKuZBbkZVqtCqbuuX9A9mKjpCQGxQj+UZOvZR
	yKHrJ+iSgrnnU7PGVLUQGLudN1yCbkC6jsLXpecs5LVj3f2SRaVkZxihbAUZOhljW6c=
X-Gm-Gg: AZFdTZd3fzaLXilhy1A9H42ov+cYMS8y/K3D1hYLsrTej3zFsmC6ASdcDZpy2M1bRbZ
	QJDFJ92gmNsdRHsurF2EDcE0/7ND9M1Kxi6hVRTSsdu+UQLTvGqLRK75KMrFVqeyMocfDakO5C9
	wm+EhktNh+1GBEqJWXQX2Hcnzf/Ow4ZhyJCNc1Oc+YjWwfLL0iJHRgLumEEtRWoYEC9m36Q7Edh
	l0l+DK+s0k63SBlbEOkNJxBSPM8r51qu8Pz3vHQmORDgWcS1QZwuaRRgD+DZ9YTu68zF2fhBKoU
	/46QVvSKd1ty2L/YYeAYUXIWFhFLlhE1ly9bxqDU4wcauWIB+HSxSOz1mR6iZycjT8twqaZ2FEM
	hDVy6J3RfsitE6oYO7cdOapmq7w+QDFNHJmuVHhPcKSUWL7nSKrr8G/YGBI/TDfuY4gYTjQ8HUy
	NVU9PeGv37SRLS0jvZuCeDVib1iCIebUw7uKG8h4F00UYGoVP242nknb3MFPzPVq8L/sj5cq3EH
	LMTkh89/uxGrI9luIBMvB23D7l62oudBvNlZjjnzTiCDWWbOKkTNIxBuxx20nMBD0YlPivWv/py
	hPyjtRp7mdm7G9qSg62CU3M2IdqzfDOX2UQTaneHfKRWhYlQiDIhcLTpqw==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr229426595e9.12.1795448810466;
        Mon, 23 Nov 2026 07:46:50 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88442693sm312466955e9.1.2026.11.23.07.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:46:50 -0800 (PST)
Message-ID: <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
Date: Mon, 23 Nov 2026 16:46:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf Hansson <ulfh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
 <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
 <awAqqg6F2Z1t55x2@ninjato>
 <d94ad9ca-afdd-4301-a69c-0bbad5b334fa@baylibre.com>
 <20261123103633.GB2959742@killaraus.ideasonboard.com>
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
In-Reply-To: <20261123103633.GB2959742@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_074652_361530_C47EB82D 
X-CRM114-Status: GOOD (  16.68  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Laurent,

On 11/23/26 11:36 AM, Laurent Pinchart wrote:
>> I know several SDK versions exist, and supporting several of them is work for a vendor tree.
>> As Geert's cover says, "While upstream Linux must only support sufficiently mature firmware versions, vendor trees (e.g. renesas-lts) may still want to support development firmware versions".
>> Each SDK version can then have its own DT there.
> 
> That's not how DT works. Please be gentle with Krzysztof and avoid
> increasing his blood pressure :-)

These DTs would stay in the vendor tree, so they would not reach Krzysztof :-)
Upstream would have one SCMI DT, as v5 has one table.

>> If a release that changes ids is already out, it needs a new DT, or a quirk for that one release when the DT cannot be updated.
> 
> So you're proposing that, with any new firmware that introduces an ABI
> breakage, every single DTB on all boards in the wild get updated ? That
> just doesn't scale, sorry. Let's forget about that bad idea, and focus
> on finding a good solution.
I think the v5 tables have the same problem.
As Wolfram said, "the driver is then tied to a specific firmware version", so the same ABI breakage needs a new kernel on every board in the wild.
Either way every board needs an update, so I think the fix belong in the firmware.

I also see technical weaknesses in the remapping:
It adds a second layer of ids on top of the SCMI ids, so each new device needs entries in the kernel tables as well as its DT node.
And Zephyr already uses the SCMI ids in its DT for this chip, without such a layer.

With the SDK DTs only in the vendor tree, what technical weakness do you see in the solution I proposed?
I still think it is a good one ^^

Best regards,
Clément

