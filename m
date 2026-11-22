Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B40606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 09:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kuuYlPXD;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PwMldBDW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=; b=kuuYlPXDjfBjdGlpHMf5YQk8nw
	Xv8Ux7TIIOMfgYGz0brGuXMtJWsq/eq1WEJP5iTPu4NqZikEq0WBF3MEEV0xkqokBFuOfbJzvH82/
	8dMSoItA1JCSAr6GqEyPPLbgw5S3ciTYzPm7Z9LtLOuZzzURT9wEObAQz3p0/guL8MPQCxc9pz9UR
	enm8lNJsnetxYz3PZLryoeZ0WDQB7CKMkIrN0zyjRyYUJAQYGgbzr5yRLWLKWKBlnNyN7+qOIF+pa
	mh6XoIYj1weGac2E0ln48qMG4Re18pQCAt/eX/NubpVdkYkenztfbjOTFy59UB8fvsMbxM3sCwWLj
	cwrbSvQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV40j-00000000vMC-2rcr;
	Sun, 22 Nov 2026 09:37:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV40h-00000000vLq-0XDb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 09:37:24 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b083afebe4so305525a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Nov 2026 01:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795340242; x=1795945042; darn=lists.infradead.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=PwMldBDW4h/g9BViEG6aYtHS+wod+kXW226BOLMO4vQu6PUrDD96Qeg3GseLQatUaO
         YpItLbGkmx636kCIvDAhS0jN9IsDbkx2LiUfBH2qa2Xb2E30PcXCfxsl1brCEzc6aNTQ
         GiFL2BoRA5JrD3jSoa5IzsQiZTfa8ey3yQKU+imWlW1qxtPjws8FNRtm4GAqj0tSCtUc
         CmNFcB1C3arANr+Pc7YzHqLDPTicPT94lYQoc26NlLq5h7tIg1ZD4c3Ln+o0yseH/W0Q
         +nH1DzFt1ciR2GxzATXECLgKX3gC9QTsvWGtFE5GyV/ObarQI/88KfinAYjuSQ4iUEzP
         2CCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795340242; x=1795945042;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0O70Q7pwLusshInas4sUrkw+Osg9GoLbcJc1oYS+7u0=;
        b=TEF0NxObH7cadaCmreBwyiP0aLBIkK7VkwXQ+NR2q769GdwxY/O6HsAiW4+VPKYxWw
         s28SY3rSTzaYCVTYBd0DNoFKhHtj+JX+lFYVgStjh56BnPUAl8iwlnpwnnjiLPKWZ0zc
         kmQvWRBuE9p+An2E7Z3u5fl6Nb7vKeaQIFhjbhvgE8H0SgR1/s1jtzmOHcBgnSnx8I05
         g/2CD7/QV5IqoSi+y0oqCBDIpSWyBD51adugCRPP7EfkOWrlR7x6F5YhOxozrJl1aNP0
         F5at/Ywy9CB3iaEXQg4FG44ho8cR4Z8Y9h/kOxkAwtUJuB8Ed0Ctj2TXfBBZAcpMdVEp
         Rgsw==
X-Forwarded-Encrypted: i=1; AL+hErFt3R8FuIUDd5AcsMJdn7U8xQQAAxObUV0QqIcwS4fCFpUMsxXPmxb6Wcy+OrOrWYc+18/2NRRPAFbq1dqSe7N0@lists.infradead.org
X-Gm-Message-State: APuU4Z/J5FUG3OwjiqbIl8NCaxaY5WgV3wzhb7KFuzwNAMmhGMP+XBmi
	mnP7nNOIauAzBJG2/0kJmAFQ8CPExB/ip6Q9WojG2cHTz27T9YFzDcoJ
X-Gm-Gg: AZFdTZfW3k8A0PCI1WDMQkhklRbVN25fzoCft+5SNFNKdR3FkyG34Ug77YbizX+zDvj
	QuF4xkEQlfkHs9+UjRXCkdlytegETN++1QbyIqbfgN2aa/mBqKAhtNeslGgEr0WI121KjLBnlzX
	hpQPbkL0mb7MA1CKWHYQaG9k8Lejyg2WGQMXgQtTRWU4BDrkZNDJX5xvmTUZNt41m6YTALbR8Qf
	oaI594jlsJvLsi4bbXLwVodEIw8qCy0uZodN+SP4j71DzjP7E5r/N2EqwegTe/G7yEoWRJC0rv8
	lUPssYrQ41DSDQzWOREbtBtoxP+5n09Vun5j6C1b2iesoe7GJZm92Lw9TwI9MZS+NUG7AXwV1gX
	mbNgrRQ3jX2akdCpt31nlK1g9VGhGp9PUvyx2uE0vsV/L3P2vSRNiLUVEvGdGjnXYx6jSUNp0bw
	t/ZWc0ylGAtaPXTeJCnL3VlofTs9Mzlcg6VVryMdYqvE7mL84hABwlpAWqS3FOlNaoo+a7kO9BG
	NV1c/yLEizaMJuKbfrK5KEGYu3cDq7RskltoZIMTKI5hNOh/MBTiXFhRqODvJVj/Q+3yZqQ2iNF
	mtPfA6QaGoFFcxs8f62Kz4Cp0g8hAra/UsWRhTn7N8eFQyT1iDimd7Nk/30zzGWuKpAZGRsJ9cy
	bEPNVAbQGR3aKQN46u8ZQH/JFvoM=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b41c98a1f8mr12481111a91.6.1795340242152;
        Sun, 22 Nov 2026 01:37:22 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm3367272a12.12.2026.11.22.01.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:37:20 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/8] serial: 8250_dw: describe the Allwinner H616 and
 A523 UART configurations
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Sun, 22 Nov 2026 09:37:19 -0000
Message-ID: <179534023971.231108.3039673113639895699@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_013723_173329_71CAB5F9 
X-CRM114-Status: UNSURE (   4.85  )
X-CRM114-Notice: Please train this message.
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested patches 1-7 on an Orange Pi Zero2 (H616), backported to v7.3.3
with the two prerequisites; 8/8 not applied (no A523 here). The UART0
console at 115200 passed about 700 KB out and 350 KB in with matching
md5 sums and no frame, parity or overrun errors. UART0 and UART5 come
up as 16550A with a 256-byte FIFO, and rx_trig_bytes 1, 64, 128 and 254
set and read back.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com>

