Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A06A606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 21:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u0xRd2WP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aodaVd8j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=; b=u0xRd2WPSzE6sv
	9I5/oRXrb4eRaMijEDKHE/SJ+31yXpGKJsK7i/ioodMQe1AhQzqgX20C1UPsYROyuTZGMTr4PYWHS
	3ilxx9nj3HDuFl5OzA6wZo9xRgQMtEYLv/Cz6+scKtddeQe9NIYbtdJC9sdgEQdHP7K+dTTLzyiVE
	f5UXazE11jiKcxA0IGho/A6kPxqvl09QTP8AC+BAMN+uM9so/5KulhMVqPuI0wqiN2NdJWw9nSx2/
	p65UyMaU6sW3+yNLNagaB9xXdWUvQzXVoIqofFx9OlgZtg5TxXAiEy3VjnhnRvSFaE86wwZQiyP2t
	HFY2TBuDa9+peXNFCbCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKy0-0000000BQWs-3E5a;
	Wed, 25 Nov 2026 21:55:54 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWKxx-0000000BQWQ-3eOT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 21:55:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3970402f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795643748; x=1796248548; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
        b=aodaVd8j7HhtGXXFOSV0BeCFtmU0LK+1jd8/nWwpr/2B6mIvpiimFseHgOLpGR4+bf
         9dPU6hYKhevCgazEePcRnztY2LNt+MtO/rPBtrOGSguunQhCYaOwbCEq9fKxYCD5+NYE
         2QTvPTri5oQSsANRTsLSQtkLrylgSvS6AOgSghmNggsA3GENhJDDRtKFcOBjlhgX1SHa
         eeh9nJv8ADHskP7ubhN3aby3XK7XRystkka3vNk2SCRcfypeGFqKHj+l/TAnOq553Ixq
         vL0wn+Bf2olujEOPFKQMUb3H1G8m5jT7MlKLszCPq7bj56YAndiBEP+VycI6hq9lny0k
         nxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643748; x=1796248548;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r/GY1L0M/Jj/tnpXLztwrdoGc8kg+51R6Plf4ICZ1dQ=;
        b=SWrpxNKdAgZSTGuRXgRbweiJ4+PuemoJAEDtFuwJeRlJ8h/pFL2YIcEbZNxk34pYLJ
         Ul+G1INKiSHsXjYt5DI9TDf5TTp7uEA3eEtbiICugG5xezqcOtxjtLDM8d77bX45uvRf
         q0GRNFXWhjnaPoyC99/HHVjfYiRJM/27me/MBpEbHIIrk779vYW9zOh7L0hpCrQcythq
         fQXZPuLvhjVvZbDKa2d4a9F94tnCiAko9aYwvm1EFtQkignTI3ptjaCzgQv1Z3lUGMu9
         v/TSbvgoO78YhSRHv+40vIhxK5BXZ4zspQFt2Tbhko0WKtUbSgM7tjKhZ2vHNflVeUhw
         +qNA==
X-Forwarded-Encrypted: i=1; AL+hErHxFCna7omwTafpvXiude6OfhZzf6zcXcZ/bwyifAYXOeOttParwHcP7LKBaewWprZXVyGwZ6l7mHod6aQ5IQcH@lists.infradead.org
X-Gm-Message-State: APuU4Z8af0vOQK9Fwby7DrEvqzd/LtW7G6IKuLg9AIXK3oeC8bV5YEf0
	j5/MUrDMKnnI1q8r1M/jhENsgrBjigZLkHuAbydl0yQ/p4smTua2xx9r
X-Gm-Gg: AZFdTZcNcb0rIT0Ht1vvInLJO9ZWMzMa59jgHPx0aeiNuI7FFNwyUPIN7hqbO5HBY8j
	rHwL51IFO3K8+HEIyzWPc78r9iv9xNfZHOOkCTaMS44kNz+5B+DD9DOE3QuPcBQEgxfNPMNDngB
	gt5RNj4DoLoOff+7Oz6rKLyj9u07i9E4QrrxvcOkkAxpyseWBdeMJ+96pfAec6O95C9x3E5ywly
	59VVnZ17LzNN3pvn1NtSOAweJ8TPu3tUAT12p/Un+DuWrG2+GlE1Ua456znzf+RFOQ6riMD+450
	S+8WcFy9l46OBT6+E0+u/KvtZKzzooUj9bu9bzBWiJWfukns7VGXBsGQjxvfv8cPnnXLxRf/9Y0
	cmoxUM0vJMPh0aSdaGK/mJTDaSO0jIXgAUO7rS8eG8aSuWikE9bnFpXNheFLFRhWqE3dqxxSLeD
	6WM7VDvrwgjBeUAYFNI07mmvjs+JoKN+H6mcpiy13hqWP55nlvgLWofcJI0016iXNIvyfuvpgAf
	i6qP2l03bp+nVPusfumTrUwxlxjnHhcyeFoiac+FWOlTzMZB9YYk5ycYwEEUaErNpToCT5lvj8j
	vBB4oJgc9fvwyBv74/cJgKurlgLIFv3Ao0EzlNODC05VKrg9n/jmVWM=
X-Received: by 2002:a05:600c:8b11:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4bb8881c630mr403408355e9.27.1795643747772;
        Wed, 25 Nov 2026 13:55:47 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865a2sm566394855e9.3.2026.11.25.13.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:55:46 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC net-next 0/7] net: cortina: CS7542 wired IPv4 hardware
 flowtable offload
In-Reply-To: <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <7252b836-e375-4550-90c9-b0e3ab7fbb6d@lunn.ch>
Date: Thu, 26 Nov 2026 00:55:27 +0300
Message-ID: <179564372798.5.10006827612276789857@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_135549_927399_919DBC93 
X-CRM114-Status: GOOD (  12.31  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andrew,

This is the first standalone offload RFC, v1. The prerequisite CPU-only
Ethernet series is v2; this RFC does not replace that series. I should
have made the relationship and architecture much clearer. The next
revision will carry an explicit v2 and a changelog.

There are two separate chips on Almond+:

  LAN1..4, WAN
       |
  QCA8337 external switch (existing qca8k DSA driver)
       | CPU port 0                 | CPU port 6
       | RGMII                     | RGMII
       v                           v
  CS7542 GMAC1 (eth1)          CS7542 GMAC0 (eth0)
       \                           /
        CS7542 network/forwarding engine and shared DMA
                         |
                        CPU

The proposed CS7542 Ethernet driver exposes two full Ethernet netdevs,
eth1 and eth0, despite sharing the DMA engine. Those are the conduits
for the external QCA8337. I am not modelling the CS7542 forwarding
engine itself as another DSA switch.

The CPU receive path is QCA8337 -> RGMII -> CS7542 DMA -> eth1/eth0 ->
DSA tagger -> lanN/wan. Transmit follows the reverse path. Ordinary L2
switching remains the existing QCA8337 driver's responsibility.

The accelerated routed IPv4 path in this RFC is QCA8337 -> GMAC1 ->
CS7542 FE lookup/NAT rewrite -> GMAC1 -> QCA8337 destination port. It
bypasses the CPU DMA path. The frontend accepts standard nftables
hardware flowtable requests through TC_SETUP_FT; it is not a new L2
switchdev implementation.

This explains the QCA changes in patch 5: its optional four-byte CPU
header adds an identifier before the normal QCA metadata. With the
identifier set to 0x8100, the CS7542 FE parser can locate the inner IPv4
header. It cannot do that with the ordinary two-byte QCA header. The
new tagger therefore describes the external switch's wire format, not
a DSA interface inside CS7542. Header length is global to QCA8337, so
both CPU ports must agree, although the present accelerated path uses
only CPU port 0/GMAC1. Management uses MDIO in this mode.

Your patch-2 comment is also correct: the unrelated blank-line changes
in include/net/dsa.h were my mistake. I have removed them locally;
only the two protocol-ID additions remain. No replacement series is
being sent while this discussion is ongoing.

Thanks,
Fil


