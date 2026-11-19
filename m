Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DBB606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uClaqs7Z;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=dxJnOMHj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=d4uWrDX7zSkzZqLOJTxS5A0HYGBte0tk9t+WFwpVL4U=; b=uClaqs7Zi9uinA2DWkXmoZNxBI
	LLdDsEqpnPWH/zaB/BuJ7u4AlH6AXlnpzAAKWYnoF4tbjUCv3Nfvl+ozEEYagWWyZHmriI0CumZmX
	ghyfR7pFNKsfsepZHoNGwjXyKSLoLEKn2hHVq/6r8aralNVqFULnUPwwWmJzdC7BjP6s3VICjq5AB
	Yv9TeBuZNKQ7SUz0XOq2q50RzcEs/xiR2sZ8Jo1YK9xEJlESc/6iZAuO5wYhiTauO5mGHvGKw2e0b
	ztKI1h/h23m4moOaxP7uWSiqU5mChyN4omLGgLZDk7Krd1PqKenFR0ineC9mG531yULJ25/vyU1EM
	D7nTq9Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4TT-0000000CY7C-2YfS;
	Thu, 19 Nov 2026 15:54:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU4TR-0000000CY6j-23tZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:54:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EC24AC4CBEF;
	Thu, 19 Nov 2026 15:55:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96EB75FF9A;
	Thu, 19 Nov 2026 15:54:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 725E811BC01DC;
	Thu, 19 Nov 2026 16:54:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795103694; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d4uWrDX7zSkzZqLOJTxS5A0HYGBte0tk9t+WFwpVL4U=;
	b=dxJnOMHj3Qc/cZb1vPNqQ6ynyUgmJE8wACVPr6euR9sxqcACRoKlQ8nrsYvxzprnYmbAAz
	bzHtJBCtCYJffGgDwFSwHl3z9JQEOg+wHGE1HytEkpz54x5TXlJ8CwA/1K8TxVc6vL0Tcw
	HQVoy1LyH8PF5ACstg9XTbH5cChyzUzWNMdKYNn4EeBKw04/VflXJDVtSnQSQPDaPlV35L
	E7mBRp3rtBI8yECXmFLhyQvCDbDSRn2TIx5tL9CANO6k6g1jDBDNse4RXjMe+d7RX8gvX1
	03kxaune9tA/7XrjWCCr17P9Oi8fq3nIkwrPQi2y8W/IPH6Odg4qEKaVhPgnrg==
Message-ID: <9b0133ef58eaac423851e9a8e34676ade7fc2cf4.camel@bootlin.com>
Subject: Re: [PATCH 0/3] mailbox: Add Marvell MHU driver
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Sudeep Holla
 <sudeep.holla@kernel.org>, Cristian Marussi	 <cristian.marussi@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Sunil Kovvuri Goutham	
 <sgoutham@marvell.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Thu, 19 Nov 2026 16:54:47 +0100
In-Reply-To: <20261119152944.276763-1-paul.cercueil@bootlin.com>
References: <20261119152944.276763-1-paul.cercueil@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_075457_677887_1AC73057 
X-CRM114-Status: GOOD (  15.40  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

FYI Sashiko found issues in all patches. I'll send a v2 tomorrow or next we=
ek.

Cheers,
-Paul

Le jeudi 19 novembre 2026 =C3=A0 16:29 +0100, Paul Cercueil a =C3=A9crit=C2=
=A0:
> Hi Jassi,
>=20
> This patchset adds support for the mailbox found in the OcteonTX and
> OcteonTX2 based SoCs, which is used for SCMI communication.
>=20
> This is technically a v5, where the v4 was sent in 2023 [1].
> Given that years have passed, and that the original authors left Marvell
> AFAIK, I figured out it was just better to restart at v1.
>=20
> The last patch applies to the SCMI driver, it does not have a direct
> dependency on the other two and can go through the ARM tree, if you or
> the ARM-SCMI maintainers prefer so.
>=20
> Cheers,
> -Paul
>=20
> [1]:
> https://lore.kernel.org/all/4397b39c-084b-954b-956a-5168a3c8958c@linaro.o=
rg/T/
>=20
> George Cherian (3):
> =C2=A0 dt-bindings: mailbox: add Marvell MHU
> =C2=A0 mailbox: marvell-mhu: add Marvell MHU driver
> =C2=A0 scmi: driver: Increase timeout for rx response
>=20
> =C2=A0.../bindings/mailbox/marvell,mhu.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 60 ++++
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 7 +
> =C2=A0.../firmware/arm_scmi/transports/mailbox.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A0drivers/mailbox/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 11 +
> =C2=A0drivers/mailbox/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/mailbox/marvell_mhu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 267 ++++++++=
++++++++++
> =C2=A06 files changed, 348 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/mailbox/marvel=
l,mhu.yaml
> =C2=A0create mode 100644 drivers/mailbox/marvell_mhu.c

