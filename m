Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672C3606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gofELvi4;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Alvq1qnM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hXmxFeoTBX/tQ++ntzQj/is3shY2/2htZh6VSebwwAc=; b=gofELvi44AnZTc
	9OH2JawyUdrgpjq0aX5xwCEvo9WNHjtn+NbfVdCxkvf+cPoxWlyJ8OU6ZvmM0QweyOF7CWlC3KZUh
	gaJRD7XZ6uRSZ/3s//hlZowC4Z6oqYWF4QAQTNmFoPqokpoyW7L7Ti7Pl812thWbu3i/WyPKTi2Ra
	rLHW5SWZ2LAqbqG1Btkdw1bo8xSkLm9WWZ0OC1Mtnt8p1/eDM+2zBIVllSjuYoOEyyZHQVg3f3Zph
	c3WM887zefbQud1wTsoAQ/PvxWbVH9QXKUSyFbH9A30Af+nUF5F7pUylY3TUJs/6Uz/6wmi0gtCom
	CnakWsPFkCbWVHzhDEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZPc-00000004ccp-2kYL;
	Mon, 23 Nov 2026 19:09:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVZPY-00000004cc1-2zdp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 19:09:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so16710385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 11:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795460946; x=1796065746; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXmxFeoTBX/tQ++ntzQj/is3shY2/2htZh6VSebwwAc=;
        b=Alvq1qnMtirZ8mx4+b1/ro5gEW/YNcC6gFnJldHMyNrYPGPAUs7ifbnNYnGNpAKAOr
         jjotXeBhJ9UvN0Y5mi707jbB2rZ28tM91V1Fei4oErgfMG1KXqz+rFGKR8xwLGQ4D41r
         md3ToaoaiIKDslkwwrYnq7SRn8jEdVMqqaMGQFwb+wYFWZVlBKzxBl11SraUc4VU5LFY
         +cAISdJWAa3hbqQc2N/+HyOJJQt4On+4lgvASVaqTzKA4F9JuqeNe3B5OHKEdO5taFSz
         4n6GYSEuwWx6yD5rh+pyrZ1Sj4ppseNMEefAMeqeGAv8/tbJ98G/55fwjWSqaMOYdWL0
         tsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795460946; x=1796065746;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXmxFeoTBX/tQ++ntzQj/is3shY2/2htZh6VSebwwAc=;
        b=ZACp4pLn10DmWK/VFFQwz2SvhUw6glC0JFTee9+L97S2yZcTjEY8cPbPyyAtKoDT10
         inqXFS9piW2YCdgBKMXS343x3R5HfknLPDEdcjzmKT2DSN1G4fzz5DiRbsN2qZrzU3ta
         kPuPuiVtbTwGqhJKGA/f2taWFWwGsMQgkXNZnQKtf5wQutSW9tomyI8mABJ944azHNij
         dNU1tOOSzXLVF+YCpOQ3oyo9cWjUDnP1OBpslqKIz3+yDEPtBs6KhSAYTSloLrxukaMT
         +tCYZ2NlTAnUTi2Mczaan87urQTucdwUhWb0PTQwYBtZiFiRF2aIKkGQhTPHB7jx+/hA
         hzKA==
X-Forwarded-Encrypted: i=1; AL+hErF715AfCETggKVig6Ere7ZGAtamxEiCWLFme0PWgbCVLp93xHc+eclxZBy/zLpwRl3D6yDozO7wWwDR6uRitjYs@lists.infradead.org
X-Gm-Message-State: APuU4Z89JUVga+ew1HXLQ/OVIc3oT9BMak/rj0d9W7wVitWQyNCOXXPO
	Gji5+JJhZeH2TbkhTxGj9XgMGqPAoiX2SOO4UkqdvbtTxSV0EhCz2W8JH5l7j5ZE41U=
X-Gm-Gg: AZFdTZdmB/kvOkOXxqOqZWXZorN4knhTPWt9oFGJGS+ByJbN2d8SBroW+9vwnQTThKX
	UXvDXKSGk7MuTZj13+xZi1k7tmGZ1X9GUYID5e9I4dJkWBYa8abjx4v4AK5t+PvtMwgqhqth62A
	sMk9qNf9fRwY074UtgKCzQGh4nqeLhlK0IARs5A77bNpMHoW/uahzDDtVlUmUMMFgJuEqLHo45Z
	ZkLb7t83NXeO7yKrB6V0zyqkUJhB/5hbYAGzMNWhVqITC8G7v397TXsfd4cTMW8RQdibxiENRXM
	vWP1uOP8sprCSuVPhBz/1VRjo2jA7y4WDLIkBYfZpqujjZ6WQ0XONy+lmQtWJeJX8B2OO9G4BQ4
	vJDaTa9YvZQXMJFKY0co1B8ma8hMkoRVM6Ip/ny1lJ0Sik/si9/+o3ikb8wUme9wJ7WW1uVt7O2
	LjO++KhieOPiKnArumhLEswK/prrC8EHEz8s/hYWtgCo6ngqVc0hGsAokOIdhO+42nYxLeZKeMt
	h3xlo0wgJv4qKFWNlpdzl9Rg1ppanzBDHHd+umIoLDDrWET5a6xwrVMG+mN4gfmdip4HpyJmEog
	lqfSTRxKp/6jvI658mwGqi/PTZ1QntfkB5km68ngZz93FDV5emwNjloNow==
X-Received: by 2002:a05:600c:3e1a:b0:4bb:6814:7391 with SMTP id 5b1f17b1804b1-4bb8881921cmr248187205e9.25.1795460946295;
        Mon, 23 Nov 2026 11:09:06 -0800 (PST)
Received: from [192.168.1.62] (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm24014155f8f.44.2026.11.23.11.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 11:09:05 -0800 (PST)
Message-ID: <27796cff-eef5-46ce-8079-93a0a8d40db5@baylibre.com>
Date: Mon, 23 Nov 2026 20:09:05 +0100
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
 <fc13a7a8-b825-400c-9ea0-ceb2670dc478@baylibre.com>
 <20261123160550.GA3050935@killaraus.ideasonboard.com>
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
In-Reply-To: <20261123160550.GA3050935@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_110909_004308_A5A3A4CE 
X-CRM114-Status: GOOD (  13.81  )
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

On 11/23/26 5:05 PM, Laurent Pinchart wrote:
> v5 supports one firmware version at the moment, and the driver would get
> support for new firmware versions when/if needed.

This is where I disagree: I don't think a SoC driver should follow the SDK versions.

> I have yet to see any vendor who can provide 100% stability guarantees
> for SCMI firmware interfaces. In theory, sure. In real life, I just
> don't buy it.

I agree that while an SCMI firmware is in development, its ids can change between versions.
To keep the ids of a released firmware stable, I see three rules:
- an id always names the same resource, ids are never swapped,
- an id is never dropped: when a resource goes away, the firmware keeps its id reserved and denies access to it, as SCMI 4.0 section 3.2.1 describes,
- new ids are only added at the end

I think upstream should only support a firmware that follows these rules, with its ids in the DT.

For firmware still in development, I agree with what Cristian wrote on the RFC[1]: "fix your firmwares AND/OR apply quirks in the meantime".

Any other view on this is welcome.

> We can agree to disagree on this, no issue.

Sure, I think we both already know we disagree on this :-)
Thanks for taking the time to discuss it

[1] https://lore.kernel.org/r/aekXUvIPb8nkhdKu@pluto

Best regards,
Clément

