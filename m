Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43356606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iszbUDtF;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BjaxrlUI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=; b=iszbUDtFOkHg1Y
	kzg6RSfpAudw2ge+BntO00duOkbnwA37g8xEIQKXlPZtTf1SM1T0sodNSQlXSmnZre/eCiID3B5VG
	LAE0hoLgPR3vbvQ1bFxLQvfUUk9rnekkVdIkyRWb5tJjmgzrdnySasXSwyRPEEHLzcryHnXp+hIwC
	iggbLXeuHB4ByYr/cwC78KbHzJENJJyhQajp9DISkm7j2pmdo025d/hcbzBjvQUVRnrxgO4D3Vpoy
	yboXt8fdjJ6KQm2k+qXPFSxKQFC+zKlOy/Y4oyB+y0EA9gl6z8YHc5br8ZPJdIhpDumGgVuQja5wM
	Wys85dPUEMRc5HfQWEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnPt-00000006BXk-1XHE;
	Tue, 24 Nov 2026 10:06:25 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnPr-00000006BWx-1Q7h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 10:06:24 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3adf87fc0c6so36985311fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 02:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514781; x=1796119581; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=BjaxrlUIYxubCldm9wE01pG5KxVwghAkz6M724CW0y5fx4psih8dnDOk0sYO4HYKom
         kV+asp7W0OCuBaxyXIbyXtHhpOsGqAjGYPlBLojuBSUaRUkuXI0+quVswcXe5O051yWk
         TRDTtVB27ZFWPESFQdqPi9KF1Ju4NDVYzyP1k8pNzdZUj0yBUGad4MhNkL1fhOSeMnKk
         n8mTAaDPIWxcAj+IoSkT72UF/DUIVikRHJr6BbllgKyOb/WiNnx2e3tXIih0FYK1g4y9
         E/mygx+Fumv/xGFYlvYY0oFIq9TwQ6EaooWSKOCPpS7K5Mynry1cLRyQ4M8jmx8DhNz7
         dZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514781; x=1796119581;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HKyC5Y8ArbHevJ7+3eNbqEfUXbI8Lmcn1USmOAduUL8=;
        b=VhqY6E1gcFPzUSPRX6WXKPSWxW4PX6FSJMca4lXEMIocmSep99DZfgwxEhPFhFEBzm
         YGcM8w8RhJUGqOi1C8aZ4Y88tPEl18gQbeWJAdNv75ANlMkP3g/sHe0E2EAd1OdRtkMo
         aMG7U9ZkS2kJA1dsXZDp2RsAqM2FtOSGTNr6gtXa0MX043Ae+3xI9nF1qs6NeX4nNSHQ
         WOKPGEgzPON48RXLDFpJwMyfHIw/luhF4Yroo2giIBlc9gQEiplQ82lAKSb2FK3wvEqS
         Oe7pJPIAnzcDZTx0JyMXEj/j//HSCBIaalsQU7uG3Fjm0ZP2hwrL5nsI22EWoBAEu6pT
         Xkiw==
X-Forwarded-Encrypted: i=1; AL+hErFLLGr3nDGrWQCr6eQqaaOB+mzE1EnFoiw9fGG36N3QrnYK7GOilj/d5AvEdY4x+ukjbvI/jMZnPr387oEa7nTu@lists.infradead.org
X-Gm-Message-State: APuU4Z8V2e7hf2q8CMpLjDyEaLBC95yMI0BDGRU96eElkqgJmwUY9ODa
	/n+D4GpknYJ3ubLp8G3Iy8iC72TOJa+20Jya+TxftM6eKUJgJe41wa4z
X-Gm-Gg: AZFdTZen6ASypgo31Q7L64h71bQFOP0HTQLLLUIqPMeOIu2p8/yAUzBpPMs2KLhjAdZ
	JqQgnFFUqlmTVV3WgQ7+rnF5NzxCccXs8WT5lai0B/kV1+o14NNlJxOcYX5AI6S8WOI5Q7Eo6AF
	dg3bfrD5BIoiV9UYx+24GMXp7COSO/88je2cf3hVmr5kgSJvMlywupaYdwnNrrP7jfKPZL/nkcL
	m3ygQyWinB1K7XNCunXjHICaYusGD2h61eqcDkmAJDe0qbPChiGrzryufvnkCMJrLm3Kpltp8lZ
	doG94zkQQyf6FbPW+Kza0WvgJZFlapQM9FEDF4h5POtyM6KfjYnBRJBVvz1KG8NmmBAefvoK6qV
	vqsL7wH8ijHfoNC4bBI/v2iWYXeQp9y/Q8g8S3xva01fNspxzS98ZCwFkzxP2eSwJFoPpYMi0IO
	fWJBLy2uJQFej9PYw/3dPvWvpj/gooP4Vk3MSrHdib3BFMMJYjktSki8rxnPie43GJE4p0fw3j9
	2GGZ7iIdqbch8Wl6ga0kVkym13KokLiUumdU0f3EuBJON08nq1zi9Jf+dXzjSR2N/x6YggwKonK
	G0vvAfIyVU1weg9h19kQ23wQETFsZrYuiR4Uc4w9LKbPhDkuK9KbEls=
X-Received: by 2002:a05:6512:3b08:b0:5c1:b29a:1ba3 with SMTP id 2adb3069b0e04-5c1bc7d5ce5mr5731034e87.29.1795514780815;
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01b423sm3627942e87.43.2026.11.24.02.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:06:20 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: cs7542: Add global PCIe controls and network
 engine reset
In-Reply-To: <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
 <20261124-b4-cs7542-global-controls-v1-2-12548785df2c@gmail.com>
 <9facd8eabb9d0c2bbe816117481dd624aa8c1f04.camel@pengutronix.de>
Date: Tue, 24 Nov 2026 13:05:40 +0300
Message-ID: <179551474060.2.10541952676329766668@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_020623_397512_56D6F194 
X-CRM114-Status: GOOD (  10.37  )
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

Hi Philipp,

Yes, those are seven separately named bits in GLOBAL_BLOCK_RESET. I
haven't found a hardware requirement to change them in one write. The
vendor cs_ni_reset() toggles bits in a different register,
NI_TOP_NI_INTF_RST_CONFIG.

I grouped the lines for Ethernet teardown. QM can still own RX buffers
and DMA-LSO can still own TX descriptors. The driver checks that all
the blocks it owns are held in reset before freeing those buffers.
The -EIO for a mixed readback is how the current driver detects an
incomplete stop. The Almond+ tests exercised the grouped sequence.

I'll try exposing individual reset lines and checking each in the
Ethernet driver. If any assert or readback fails, it needs to keep the
DMA buffers. reset_control_bulk_assert() would deassert earlier lines
on error, so that helper is unsuitable for this teardown.

I'll also use regmap_test_bits() for the gate, drop the redundant ID
checks, and move the PCIe assert, deassert and delays into the host
driver. These reset bits stay asserted until software clears them.

Thanks,
Fil


