Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF5C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BtbKVZwi;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQguBENL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=; b=BtbKVZwi4tSMNEWZIXYwOLDor0
	UmbLXewNn4SRWgRAEQBMAQIjniNPr/KwMMzE+vxsdr/GwDdV7cbOAY2KP7cug1uMeMYUdYuR5CLZs
	MD8lbdQFCMdE9s8qVVjiGs4NcD0wCHns3rQ8OEe+OjF67Fd71UZN1GI6NcS+WEL6VV/LV4rDG1R9b
	6Wphhl+FOVELcpx5VjMOLW8Q2sn4heWhPpMhD+kv0vcMqmOm+20gLoLZGjcgtA4fx5zElkl1wEbtI
	DdAMvp/FLugRyB3uNEp2l61bC33CyVY9y6rOtKAD/gPAbaGwWxGJuahBmjj8qQUy2/pKsrtj7QipN
	aplF5g1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdGc-000000059UK-038p;
	Mon, 23 Nov 2026 23:16:10 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdGR-000000059Qs-2Smm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:16:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so31319555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795475754; x=1796080554; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=cQguBENLXwVZRk9ZNYAWBQ7BGYMmbwZdiFaIwpXeUxIATe8XXgzv4lgBYY9CTfB36R
         XfR6HE5+1/lJKmEyfFQdywwzTHSGxg65OAGcxq2Aox03j1GX2sNRVXqfXnAOIRrB0Wdm
         QlkT38VEcpuMoisirFh9xPUZhq+5hnzM2rtLQv7os/HR/Yhf3F5iB8OeA2ae/vD+0E0K
         1zSifx0A/AmaLSq3uFpMytkAb6JW9IBnGjPk0qDxYvkaA/ZVv1AobaSrTP7bP5nXVZz2
         H4LTb9umIEuX0Vs1s9Y4vQq68xSPtIVIx182nylmK87OPQ0jON4n6viwmK+4uZiYiHfq
         b6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795475754; x=1796080554;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/sGiRa42r1FyIucsWxDt+Wy08NdPZogFnK1cktUjeHk=;
        b=p3Z3AVFWe1wu53xaJfEuj4ctJBqNBo6+LX/rNHelOfB6U6zTfkm149a9Ekxd4uOhmU
         OWE4R+lKw3E/+fQ6I/y3rTd4zL/G70BR5SCEJICnBdkOuoBlm7GKkb0m4/igMUU7G8nr
         In6/UE1qrIDtuWryNcRRT8LWK1iHug6hznnfN7PuhzHE0b2891RUlb5+vpoXVFlmhO/v
         ID8YYoUwbOydJN5qYeRTICvrmAz/MQ4cjPAGZW5PfX4VHshaCH454X5VTwjU13klWr+e
         uGxxsFiEERYtlyBMmJKGMLC/p9FPbRY6RjK8a4ToZuVvotuXAakTUOC2se+P7CO6f/lw
         ++fw==
X-Forwarded-Encrypted: i=1; AL+hErG3GqgJeSaLoTtbnpjjzaSfOom0HtC8uOfpYKMvDfPu3vyrb2YqTHX9XMfLzwuVcY27xjZAh980zjkqQcs9aMSc@lists.infradead.org
X-Gm-Message-State: APuU4Z8GsjGAoMr/MGbOOe7x3jCowch7v7xvXfr20knTQwaKl0NWG4aG
	k9FzkKefSYFQ91iDMbPwPZgs9SCj7gdA8EJ/U9N8SbTxVGpjrj30C5au
X-Gm-Gg: AZFdTZfgM0EpmExngkvkMbA/3bmZGOzYFIVW7BASaaW3mzuQxa9NizuL+2QwDr9duQB
	dvBEyCPbO6FJrMhM0y8/MyEuaeyWntpEQEFIIUCiYJZzlJRhI8absS8kChLC3StPmB06bO9qSTt
	EuojNCGGQDD9idAPwlseEvETfqC2Wwcy95hM/InPKdQWzwBnzJl3CsZlrcTnPCgrZK/lzS5BsFz
	vGltTq8fD0NDMlRVGRsDnT+mWHsFmLrpaIjPA0KHweGzFl3I8KHkJC6H2Hg3yG/6Z5JDUlv83Wm
	NIheke94x5dXFfQJdoub0ulpEXNKmawWdiJnRtUkI9E8/Fg3uCCXH6IBBO/Rt9L0O7+95qGMI3j
	ivxeZPL4k32EGakG83H6hgLVip/JbAtPsPyI2NVKTb69zvmoNSmyZQW6LX7KLLP5EXe5E1d9Tom
	kj+s8x2dxh0piA9VKoi3++7AUSQhNEpcT/tVYaitZj87H5CwBlTPa089ZTtQYy+nCIy9xoZWGU1
	jDoBLuCDHEmPUJW488epmMSQYbv137s9JFKJfG1ugmVB+mbls7vQJLptnt9PJwnM/4iL0Azv+ml
	OtON4pXwAIhifo1tm9aEGu8FOSagULcu6YsHloNr+aPLyH2+S1YGCIQ=
X-Received: by 2002:a05:600c:46cc:b0:4bb:6f41:399f with SMTP id 5b1f17b1804b1-4bb888236a3mr269607585e9.24.1795475753577;
        Mon, 23 Nov 2026 15:15:53 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm214620235e9.1.2026.11.23.15.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:15:52 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] soc: cortina: Add CS7542 PCIe control, SerDes and
  host support
Date: Mon, 23 Nov 2026 23:15:46 +0000
Message-ID: <179547574633.3.10816077515932240445@gmail.com>
In-Reply-To: <20261123225447.GA1119216@bhelgaas>
References: <20261123-b4-cs7542-pcie-v2-0-f589a9cd0bef@gmail.com>
 <20261123225447.GA1119216@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_151601_909815_012EA729 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

Understood, sorry for the rapid reroll. I will wait a few days between
PCIe revisions and collect the review before sending the next version.
I will use the meantime to address your comments and test the changes
on Almond+.

Thanks,
Fil

