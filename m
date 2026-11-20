Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAF960A2600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jyxqiM02;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Slnbx6Ir
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=; b=jyxqiM02Bckoza
	C4JUi+gWsN8P2/2K8XphXEaBNGCcsdM9MtYWshdvfAhdvRDJJ+9NEypAaWd/KjroSzlXLRktW+IhS
	TxN6FcfkuqJgGyyexAIYMhkjK+p8d/oMcPmMEO6iwtv8AEXgPWMK1wpHGID5BLXKgp8/U3CFLJwsh
	4aIKpDdSUvp5uhYfUrjuhdiWAcwm+DubGShB6tkWqhcHqjSYRKWEfd5EASyY+q5U+f/Z9ECEUytf2
	4YkdSugzvrpN+hgIFTL2LuN8xAxClDn5iw8TCDv+7EHZrTGkdyAcLXzpr2CNGsOjmN81po7pW6ZV8
	xY33Udy1UzaQ+daifsHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULsS-0000000EbYZ-0OoM;
	Fri, 20 Nov 2026 10:29:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULsP-0000000EbXp-2Zwe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 10:29:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so6264065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 02:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795170591; x=1795775391; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
        b=Slnbx6IrvmK7269P3NgiWuwadak7nDnvflopgznlhtmNhvPNrVVtoF1+4+ZoFBEnKz
         WFpFwe7jkh3uAXkHegpyslfC6Hm6oA9aF4pLbKvHFSOQlAgtq9Ijy4gm5P96kzAbXoqH
         eMpky/m5Vp/+c756VX6U9363VNPTaTHxV/TukWj1ohEGYwVl+72oCVRGwJRvF2rFmVO9
         4uCEXASb0u0AbvA8CB6Ie+G7N9tF+GlmMg9TBdwsBHv6ki6ATvrcWWDMljBm6Te1OfI9
         Pv1sXii0heGsepleJMWEV1Wy4YdRUkUm8Bt/ctAUTeRfrAkhOK43Sj9s6nlZvdmuD60w
         7bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170591; x=1795775391;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YECa1p9LzdYXA7zGnIWZNUD0xhZVO826hfzpFJvQccs=;
        b=ZjLDc5y/pPGavo3TrDIyO6xRAdbXtQxh+XBsi0egtbYxQuK9+dT7fSJzSmLgXFEAyj
         4dWMJjJXQPMjZbwKGNQZ0vVBPGVp/aAxH/9XZFMx6ouIGHCdgQEoBQwLpuNTeEitGfly
         aibL8i2ko8w3LHe8eJn+U5TQB49YpSXG0EfD4IrVVPbqwMAtr4YIQQ//su3HijxQguFs
         aXYOtjuF/zCoQEWrHQESjL8ZNI9zaXCRWjJ3rlzjWP6MUjQ8nlG3L+M1H7ighNrUOiDE
         DjbuDtqKx05mkFlR0LCOL3ajQHGxLCBlNDh60hzzItrIM0r2ppsXmaL6PwuWA3nK939b
         +THw==
X-Forwarded-Encrypted: i=1; AL+hErG1IWBZnle4pUnfRebpPNFRq0Jl9CGVjdr/+djNP9NMexCwralMH4Q6JvbjmL3JNIkhz5fl5whJoj90hQ/ZSRdo@lists.infradead.org
X-Gm-Message-State: APuU4Z/OwBd4Z3TOeWSkabA4Pf9bJkGfXhL7azyHYobjk4OsHn8Dg2nC
	YGyxG3fe/WNSrUvXfYTEXdVwmrh+EHTAv48xPWuF5qO6fBVFe9U85fK4BMDMQXXvfvE=
X-Gm-Gg: AYBFou0TfhqG549stzw0M7xheRMgHGO7X1xzrNeueGg4paCS+vRwAPnnIcQgaTzoox8
	UVjK1t+6cE7lL9m1osLyoLfGSgc3ahrKna7YtrvmQ4DpRfssZbe+hFS2aqjzz42q91U5/djvBUh
	GvQCET6QrlaW/DowyZBaDJu/X/8Fv5/lT1o55boP5a3e1AttS8UXvjLVSmMeix+qLq7yp26DCpp
	4AyaHBLXTod6EbMKlxLcgBmSGTaPQ5GFuYF+0yQLWzr2yKl0vIHrnDNNaxbEZkEuw9zBh6/OlMk
	qnee0PR5nDhcvHG8iJcccSJuzVV7IQpQxOAvCJQzh59YPKmWN+s3dK3IB78nGBEIjT97UtE0SD9
	l/imuR6KNRDPYJqUKeU7lLsvCJ5dMqviCMBc/wsoqAND7IOj2y71/QNrNvv+zpjNwygAqsMNSqE
	pzaEJOeGTGPpOvpAIiTqQWxmyeWPneT3A+iz89c7QvQW44w+RjY29HGzur4uqB3VZj/RggkEY/0
	nXomL8vHtq/aJP+r3t9UbNt2xdyeIuqHNxRVKYa8+dc4rS1OOWYBPxH0qq6ePrl8+5LkrmqCp7L
	rDyBLdTderV6v+8qwzhLhP6eRJCQOsQTPxRtP4HNccC7GW+2Nkdfm7F65Q==
X-Received: by 2002:a05:600c:64c8:b0:4bb:605d:8e92 with SMTP id 5b1f17b1804b1-4bb8881e767mr51613175e9.32.1795170591115;
        Fri, 20 Nov 2026 02:29:51 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm65912515e9.10.2026.11.20.02.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:29:50 -0800 (PST)
Message-ID: <19c3745a-6308-46ff-bb37-3acc88fe22e2@baylibre.com>
Date: Fri, 20 Nov 2026 11:29:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/15] R-Car X5H Ironhide CPG/MDLC SCMI remapping
 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Paul Elder <paul.elder+renesas@ideasonboard.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1795029012.git.geert+renesas@glider.be>
 <1e9c5ac3-d82b-4af9-9946-0302cadf7404@baylibre.com>
 <20261119234759.GB2324725@killaraus.ideasonboard.com>
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
In-Reply-To: <20261119234759.GB2324725@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_022953_672837_13580DE1 
X-CRM114-Status: GOOD (  14.44  )
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

Thanks for your feedback !

On 11/20/26 12:47 AM, Laurent Pinchart wrote:
> As far as I understand, the assumption impacts the mdlc and cpg drivers
> only, not their DT bindings. If (or rather, let's face it, when) a
> firmware revision later breaks the assumption, we will be able to handle
> it in those drivers without affecting DT.
> 
> I don't like this remapping driver much, in the sense that I wish it
> wouldn't be needed, but it seems to me to be the best possible
> compromise given the instability introduced by SCMI.

I don't think SCMI itself introduce instability.
It only defines the protocol, and each firmware choose its ids.
Could you tell me what you mean by instability?

For development firmware, Geert's cover leaves it to vendor trees:

> This list deliberately ignores ID instability and the need for SCMI
> quirks during development of the SCMI firmware.  While upstream Linux
> must only support sufficiently mature firmware versions, vendor trees
> (e.g. renesas-lts) may still want to support development firmware
> versions.

For a resource that hangs the platform when Linux uses it, the SCMI server should deny Linux access to it.
Until the firmware is fixed, a quirk can cover it.

Best regards,
Clément

