Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933FB606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vUtonk1/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xe70woZF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=; b=vUtonk1/jgcICks+3iL063FdI7
	/tJzyt8BClXCGGdaBQxS0xjkPMkobF0BkQsCrzRDBUPwiLJQRViOqkmAu7ANovgeRTid0va4y56Pk
	/7fXlmjDp4lmlyaxe1ZPuQm7wdBINV/adMbWb0c7v+3Sc29NbKGKHoaFH6dACUl6/06aUjXUb2eos
	oCvOgtv8Py7dbAGpT5k239Ci4c4qz3qylywNE2oDNX7NBbauV92At9pQxuVrEHklNLltUpMcnM0w5
	aixFA4FU+7chP1ZAJohScHgqZsC7Ych3Q6tEtDCidpuN73l6vVyFFSF+XZOGrHbqahthSy3qa/chl
	psKyswyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcZQ-000000055Nu-2orb;
	Mon, 23 Nov 2026 22:31:32 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVcZO-000000055NI-08I0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 22:31:31 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso2215702e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 14:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473087; x=1796077887; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=Xe70woZF2ckrxsuxMEw7E5CmFuinGphsPgNfdT//7JDXxVxiQkyLZczZNa3rvZhCnG
         rq3luU82SJTayx763dTnuwFVU3LWVN9yxYFmTbCjh/nvPb0gseyhSSsvQUGmpTkvhrxN
         bWDhA8Fk7lmmu2nU1sO0hDfu2kixnJ5mnTSfRyYi494kG87NKbXH1JXXjo2b6lHuSQc9
         VOlxr9ewRikcagQjvN6RO/U45FVI7989CIBkihb0OW/n9VgKPtlSSyRdMSeaegQxZex1
         QRq67JaCPHyr3jpiQONe9M64vuOqBCIw6jsBGEAYsiNV+i2EfSahRpkgixjz1IPVpDV0
         hCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473087; x=1796077887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=hGuf2Fp77D4Vj5aWzGcI9CTx9LjQ+1WTS0piDqjNCBR4p0VOQsHqDecTeK94woUer7
         stjqp/5YpXc8s+arOC19C9u+KcYyg9TMVy16aKQq+FY2IrX/CnmoQ5djYrgVPm6L/3Em
         4EuyoZULOERX5AvYb/Y2iRUB4kH7eXu2WrUt4d90UI36L653Qlko93MD896ExjIO/Pgg
         S3Q4fXhbLbPonjOz9jpkEQilBOKjgNdu/SMO/cM5kwJuh8dbLEvxRotsW2DGS/JxWCgS
         tvvOZ/t9LoRo/6TLUDRmKiOD1t6Iq9Yq4J4tQ+DMi8ndl6TtmuYhi0k3FIiD6Pb4Rnpi
         mA8g==
X-Forwarded-Encrypted: i=1; AL+hErGdvMoa8uGPCUh47QmqyS8eP4w7kvDa2sdoe5MNZ+vhfKgVfRrBPfKBPIOppCoIKQGfnrveh7t1aaz5SN3VMqR6@lists.infradead.org
X-Gm-Message-State: APuU4Z8uDKLotm2BasZ6ssqO7jFUGOQQLNBui2tA+ZPyiwvdlM6Lr4Ow
	GeUJR73pRdLPFuPaaBxSsv6LVwijT5ZPMwtOQHxaFFd0aXidDYqffiFB
X-Gm-Gg: AZFdTZcmplyxnZlFLuIwUzYmhdAKa8M0eDVq7CXcjEOGXXnakfqsDWy9nRkVLGI4upl
	JoVd6W1Z1hz5MHeFtklCRVsHhuRPfhhyGf2yCl8tQ3TGDjjEjQ9XIvADO5ZFmhXQ+ZLaFs81ZN0
	2kiDArJxCtoon1Njxt1DWTgSla7iEtfOv3yKZXmiqfFE6vuFtuYHVnvj+NyuQ8DEqAi/DeRExvL
	ehlULn1EFsT1PkC+PTqoMtjhN8GJ2cOu53GVk2xiXBQJoLcbthwVSmteCunP6Ef3qbnJImRlo35
	kvIcerKWYFLew3RaqSUaTEf8ggZ1TF46yCG++95ph9Dv/LGmE1oZ9wLpHSwguBUtd0ilgO20A+q
	amJAIOAukphgwRS3+cXJXA/uJ+LI11jUYijyWLD7wj/GWB7wo3/YgGOT9g9x4oaYwEg+HPecxok
	6LPQkhC9+bU8xxLO+wGjVrYt026JQMx6/9HgBumpnCc1fSRVJ/TDt1VBmBmpmzoL1JGi4GDfFmx
	YnuMoQhsEheJe9VE9zpP0TOD+t5L+jyBrBBfpFNt1jDCT9GfH4K7T1zHyrO8fP7Wb9Rt2NgOoaj
	D5frc03kinuBt04JVYs8d6wfaK8z/WniYuAL4qrhlKKoj49749VEOds=
X-Received: by 2002:a05:6512:32cd:b0:5c1:57cd:50b with SMTP id 2adb3069b0e04-5c1bc847888mr3847641e87.14.1795473087230;
        Mon, 23 Nov 2026 14:31:27 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd052d6bsm3315161e87.65.2026.11.23.14.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:31:25 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542 network engine
Date: Tue, 24 Nov 2026 01:31:21 +0300
Message-ID: <179547308136.447306.5703918766544571012@gmail.com>
In-Reply-To: <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
 <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_143130_097378_D111C0A2 
X-CRM114-Status: GOOD (  11.48  )
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

The hardware has three GMAC interfaces feeding a shared NI/FE, queue
manager, traffic manager and scheduler. The forwarding engine can steer
frames between GMAC ports without the CPU, including rewrite/NAT in the
vendor acceleration path. The posted driver configures CPU forwarding
and exposes the three MAC interfaces; it does not enable hardware flow
forwarding. I should make that shared datapath clearer in the binding.

On Almond+ there is also a separate QCA8337 Ethernet switch. GMAC1 is
wired to its CPU port 0, and GMAC0 to CPU port 6; the external copper
PHYs belong to that switch. Those MAC-to-switch connections are the
reason for the fixed 1 Gbit/s links in the example.

You are right about the phy-mode description. Both QCA CPU port nodes
already use rgmii-id, so qca8k programs the internal clock delays there.
I used rgmii on the SoC side to mean that its peer supplies the delays,
but that is not what the PCB-level phy-mode describes. I have no evidence
of deliberately extended PCB clock traces. I will correct the example
and the SoC MAC nodes to rgmii-id, and explain the fixed MAC-to-switch
connection. The existing QCA delay programming remains in place; the NI
driver does not add another set of internal delays.

I will keep the Ethernet reroll within the requested netdev cadence.

Thanks,
Fil

