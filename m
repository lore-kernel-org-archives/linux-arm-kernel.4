Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD51606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 23:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QFIhf5/v;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMvsPMQa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=; b=QFIhf5/vnrl9KdZUuDIAfyocFm
	CRJqa8QG6MfOqyCNPLizmYWhFG9FcGDcFJaGg3GgKjPYfzsQMEipaNh7tKNwKUkIF14dRVO6zPrGh
	AUkfXPW5OJ9H5TJS05S0GyjQGV5R+eCHs8zo9aCHFRsu2ISYquWdUvAKlwy0W2tqdtXfzfK7dawO+
	Bbkw/t8cVkaXGOEtIVFv+zpFJtkq/+360Y88nfa77zqSTbipkz1N7F1SOSL383h4Z7Uj8ymrZhU2t
	pUnYSmsZXHLUH05cD99jFPtpbnN0xUu+JVqpUC/iuVLuKQPjdL+lzDLEe37Qp3eojn6Sj1m0PM6ti
	+vqvPyuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdfx-00000005CRB-1FVX;
	Mon, 23 Nov 2026 23:42:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdfu-00000005CQB-3uGc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 23:42:20 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4a42b34e930so3422958f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477337; x=1796082137; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=FMvsPMQaVEMtc8NUUL2oVD6SYYSf23nHeppn6oih+Hg3R0D5brvBlNqXIXyIOQ68hj
         OA9tB44qzTJ8bIpp6QVB3AXbND3sN3qDeNFVSI35jVDmz3BWdaIBqGt1ioqrMfTm2SuG
         XbuQqH4y+2IM2U8vYagH5CyrWiwzY7M2CQy7xB+QUTh86bSAUfiiEg0DZIxXOt/8RTPw
         +7J8C0VCbHYwqcyvX1+uW8uei6rCjFvLjGDxyVt2vpgdbgo0ycQYrC3TR7aCEcam3xvY
         /Lg44c5hDIaj/sRBmKYSoGUlvWQovK4j+6eke0yYfq4bSg27kt+VdkdXK8UEeuXyDjXz
         5ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477337; x=1796082137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=aKyg+1AF2NcAHU8g7yDn3Q9fBo6cSPAmUfENQXghc1LEd6FdtalwHpyUiEn9Fn8xtE
         kVJJcMqwtlapPwIwhjmUfcST1e1+pmz3w44Lzi7AUZ8R9YZ7c67EGLavpsiRWIYNZAmi
         hss1DY+6aUOUGya91GKCl0xKH6ixd+PSAPnMyVfqp40tx2MxJn8xBXTseC6+nNSTP+2I
         V2Hn+sbHqp2Eye4SVLowa6ozwv2gPt3lv2HUkezAvOkvlRwZjdpMwbPCH/voZaQSG3C7
         s5SjJF/1jcKzmH5GnFe99+eHJX/piE/5/8wVCHPZrg4FpmvogqbkuZDmSAvsi7O6D/Mw
         CI8g==
X-Forwarded-Encrypted: i=1; AL+hErFyHS9Tqs5FgMkpv4quxnRzhN9wE1zmpO2X0xjGpwTyiki7OexbJxQouDaPOkS/JPmW/dHBli7md2Z2eDscNqXa@lists.infradead.org
X-Gm-Message-State: APuU4Z8lQIg+tQ0e5n9QcGLh2/U1IODn33CTc8k0eHpSNmi22hOnUXez
	SsDe3rQud0a1gUGdCrgT9QT6hiXO4buiMV5QrjWNhM6937d5mas+7r7A
X-Gm-Gg: AZFdTZeneNLSKxSVE7YRpvqXZdYHrPtvdVW1QhT41JnjhpIPiNpd/Ru0txes9i4hHEL
	qv05rG4VAJmYtgyQMBJ4/hAGvhflRcC44WQtyrALuc4mS8P0zRpV1J+T+yiQ4oZnuWiRTkZ1wqr
	8RdHBqxTNoVQbZi043NzRXG7TfumdHcbx+igVOQqS2xf3IT/prHeNQ6frX/YEMN3MAGtl4Ad7Uf
	jKoB5Z9cLCe49XzRibThqDJDSeiqrbRZjdERk4Z1vA94zjcbn6WLYW9bZo1/u3X9wTKDvAJvOB9
	oCYCmVOrMa1OKDYo0x3dardJ51PZnEIZPMChsyrCuXptA405RtOMtb/70KlQXoPefQj6GpBIMiL
	JgjRlABqaEI8uAhMDtT5RU9e9FPJonl4CcRyqd0Fmjdu338IV4qsTNJLscPOTO1NQD7byevGJXr
	bChh8/jckjwfpwsVFqZw1w0DjqMVOgQLbED6rm4LgpO1ITjv92DKZ7lCTfEQRharC/ONjjlmaJl
	v/SKwu9Qo1PZbWAOo7V9FH43sN+38XEDVO1+MYwCAJu2GcIWP0ccYUOXq8PqYZkEkds75cSfB9R
	CPljAiAENBzbS88LaWMJ/Sq204V16hTY9lisdnOyyYoE9sZqxwugU7c=
X-Received: by 2002:a5d:5d81:0:b0:4a6:f154:b402 with SMTP id ffacd0b85a97d-4abb1baaae4mr25856543f8f.10.1795477336474;
        Mon, 23 Nov 2026 15:42:16 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm23777215f8f.40.2026.11.23.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:42:15 -0800 (PST)
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
Subject: Re: [PATCH 7/8] PCI: cs7542: Add CS7542 PCIe host support
Date: Mon, 23 Nov 2026 23:42:08 +0000
Message-ID: <179547732839.3.15916995856832702891@gmail.com>
In-Reply-To: <20261123222404.GA1110511@bhelgaas>
References: <20261123-b4-cs7542-pcie-v1-7-4cde5201d404@gmail.com>
 <20261123222404.GA1110511@bhelgaas>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_154218_995414_4179C8D3 
X-CRM114-Status: GOOD (  10.53  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Bjorn,

I have worked through the two threads you linked and prepared changes,
without posting another revision. CS7542 has three independent DWC hosts,
each currently with one Root Port. The DT now has explicit Root Port
children and PERST is acquired into per-port state from that child.
Almond+ shares GPIO92 between its two Wi-Fi endpoints, so only root0
owns that GPIO; root1 must not request or pulse it independently.

The sequence now asserts endpoint/core reset before clock/PHY setup and
releases PERST in start_link, after DWC Root Port setup, with
PCIE_RESET_CONFIG_WAIT_MS before training. I also addressed the vendor
menu order, include order, constants, formatting and cleanup labels.

For the MSI address, the expression using a CPU resource was misleading.
The retained vendor value is a PCI bus match token for the DWC iMSI-RX
receiver, which consumes the matching MWr before AXI translation, as
described in pcie-designware-host.c. It need not identify CPU RAM/MMIO.
The draft names that bus token explicitly and checks that it does not
overlap a PCI MEM bus window using the resource offset. This is not a
claim that I tested non-identity hardware translation.

synchronize_irq is for the custom APP chained handler shared by INTx and
MSI: after masking/readback, an already running handler can still be
dispatching into the domains about to be freed. The locked unmask gate
also prevents a late INTx callback undoing the quiesce mask.

You are right about the physical race. The v2 lock serializes the actual
config/DBI MMIO with the IRQ latch and software quiesce; it cannot prevent
a physical link transition before the IRQ runs. I have no independent
evidence that Root Port DBI itself needs a downstream link or reset after
link loss. The confirmed hardware quirk is accesses beyond the 512-byte
RC config limit. I removed the stronger hardware claim and describe the
remaining link-loss latch as a conservative no-retrain software policy,
not a proven silicon requirement or a complete physical-race solution.

The revised sequence/layout passed Almond+ RAM testing: all six PCI
devices, Root Port MSI enable, actual xHCI MSI/INTx interrupts, host
unload/reload and actual PCI-device OF/NVMEM mapping. This does not cover
physical cable/link-loss fault injection. I will collect further review
and leave a few days before the next revision, as requested.

Thanks,
Fil

