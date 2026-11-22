Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AAE606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yoH1Ao8u;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.a=rsa-sha256 header.s=default header.b=oT1CQ8nR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=xMAMvMSuemtr/dlGWGZZg9TqU0c+ENYkoUNgtIidgTI=; b=yoH1Ao8u21ofKZ
	fYlDztvZyFjqaSe+JZcmMcm9e3/JxyWKf2LbnsePZcE7MLASfv9xJ4XMYAdZw0obt23/97++Cq4A/
	qrexBLWWDZ3x08ykn/CqcccxDdibmZIOho54YrEaEnJDV4UdR35DsDGdNwROzdW98GxzxIOfrjevP
	Q0PwuM9ovL4/AWeHqpfNmvrt34Gh8srmBWHcRXIDC+Boymh4OK1U5Xsj5b+U9+wuguEW88aQPQMBP
	Fptr7trOmC8xpOFPnCf3y/dTdtTsyB19SMRHq09X2VQAocfz+L75nG1wxnv6plonHllc9IHFx8CRW
	wmX8x6KN7xq0j07PBkiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBFR-00000001QSV-1kpV;
	Sun, 22 Nov 2026 17:21:05 +0000
Received: from vinatta.cz ([2a03:3b40:fe:428::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVBFK-00000001QQA-16m4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 17:21:04 +0000
DKIM-Signature: a=rsa-sha256; bh=xMAMvMSuemtr/dlGWGZZg9TqU0c+ENYkoUNgtIidgTI=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1795368011; v=1; x=1795800011;
 b=oT1CQ8nR7khqT7IAnsfEfPfFZmLRzxBzw3BRr3KDj8njwtc36UDqCvlwkgiVV7DK7xi+VUnI
 f11f733vgEG08UJmp4PhxoEBn4cDoPwYiyUToX1f9TZnUYXCQBKWEpDFnQaSJOyqwjXFUiqza4K
 GfeQ3BZGY1zjP1R+sq+NafYPLr8dhZSWpC+OB9AvQF0qL7iagoHFBDKcd+c7UQ4aFu4zRPRlzA4
 Ax/IjgAhfQ2ycv8NgOnSt6OOxT/mLQlXFj3q4C/xwWzpaWUEC9yaxWGZ+xZAiwyrT62SBELTDcL
 gOyv9MG7QQW9wftp73prIAygBuFFx5HVU6eaOrERfWqeg==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 3a5e5229; Sun, 22 Nov 2026 18:20:11 +0100
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Nov 2026 18:20:10 +0100
Message-Id: <DN1WUDUNU9U2.351W1X92P0BJF@matfyz.cz>
Cc: "Brian Norris" <briannorris@chromium.org>, "Johannes Berg"
 <johannes@sipsolutions.net>, "Johannes Berg" <johannes.berg@intel.com>,
 "Francesco Dolcini" <francesco@dolcini.it>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, =?utf-8?q?Duje_Mihanovi=C4=87?=
 <duje@dujemihanovic.xyz>, "Gregory Clement" <gregory.clement@bootlin.com>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Frank Li" <Frank.Li@nxp.com>,
 <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mmc@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, "Jeff Chen" <jeff.chen_1@nxp.com>, "Peng
 Fan" <peng.fan@nxp.com>, "David Heidelberg" <david@ixit.cz>
Subject: Re: [DONOTAPPLY RFC PATCH v2 0/4] WiFi support for
 samsung,coreprimevelte
To: "Andrew Lunn" <andrew@lunn.ch>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <DEJL1ATTQMVE.120JV9YW59I27@matfyz.cz>
 <aSnWYS2g5slVFaSk@gaggiata.pivistrello.it>
 <DI5L100Q1RKO.1A68EJIPWYSRC@matfyz.cz> <afI8y70U7wFT_07h@google.com>
 <DLQ9LXDE2P29.248MPYCJMT0DL@matfyz.cz>
 <787950f1-ff2f-4b49-b164-61da3c9971c6@ixit.cz>
 <20374af8-2f50-4637-b92a-4fa5c5192c20@lunn.ch>
In-Reply-To: <20374af8-2f50-4637-b92a-4fa5c5192c20@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_092058_754272_9E8F5D18 
X-CRM114-Status: GOOD (  12.01  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Andrew Lunn, 2026-11-20T20:55:49+01:00:
> Why even bother, if it has no users?

I and a few others working on the phone/SoC use it and I'm sure that
others who have the hardware lying around would appreciate being able to
use it with a mainline kernel too.

> We have to look at it from the perspective of Maintenance. If it gets
> merged, you have to expect a hoard of LLM script kids descending on it
> and submitting patch after patch fixing theoretical problems. Is
> reviewing and merging such patches a good use of time for a driver
> with no mainstream users?

I don't see why this change should trigger any such patch avalanche =E2=80=
=93
the driver is already in-tree, all I want to do right now is to enable
it for an additional chip ID.

> Does openwrt support it?

Not that I was able to find.

Thank you for having a look,
Karel

