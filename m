Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BBC606A332
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J9ToaE1b;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=DcQqrWYJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=a24+d9xvaf+CDIz2+89Hx2fexrG15RfEetPbz91IQO8=; b=J9ToaE1b/RBAfs
	/Rrpe/yr8CDK6+tYs0AS5lZq0yko3XHLbBdaUG+rswu2OCmEapp3w54xN3Ou7zLzlPYigSIXOHWx9
	eJk3o6aLIZyDPYZ9eEOm5VjkFBrgP+NGIlsbhvCOhVPQRKpJ1KCS8LOhCljX9It1r2wnPlYPXXUcN
	NCgAqIAFtifH+BmHck26UR2u944xYExOC0VwRWRtm4JVK0ux1oI8Sg01GnXOkyOvsqA6Edtp/UEZ7
	09bOM/FNQNq6u5jtPHxFgYjZd+y/2l0FI5PNCHubc9OlBuWPu/CKeZ61ILtGWRMutfutiCIvf0/P7
	oGU51GfPoYx6RqWjjoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLWt-0000000CmSL-2soR;
	Fri, 06 Nov 2026 15:06:59 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPLWp-0000000CmQH-3xJ4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:06:58 +0000
Date: Fri, 6 Nov 2026 16:06:48 +0100
X-Lima-ML-UUID: 59084f74-4df0-4d05-8f4d-796d5e595ebe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793977612;
	bh=a24+d9xvaf+CDIz2+89Hx2fexrG15RfEetPbz91IQO8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DcQqrWYJrmn/TxAwJu3//ceI1EKsNKPNB8iDm6H18mLIZKbwXuz77tMxy2jzUuJoa
	 IUZ2hw0xefq1/6Im1d3mtxNqxYDmw4m+OcCHHZF/IdnqcQGJ+VoQQo43iHqRmXPaSk
	 YnXSFCJl1QLMYypmDUuFQDY3bNrV01msSjaXmFSzn1eBcW8DwKWqOo8os+EQ59X+qc
	 TYDxHRB/h5CdG+ccCtGn9shroQvEX84ZFLZ8Gy/DjoMyaOZcb4Qj0+O4Sv4xrQ0wNE
	 MnNR1H06/oBatRS969+5s12uKSIsXWFXz0Yq7UsN3m+Yqz/XpL9zxAsEktQl7+6PEi
	 wUY2Nb0VTg8cA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106160648.05117894@kait2en-mbp15-1>
In-Reply-To: <5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
	<20261106083339.677cc75d@kait2en-mbp15-1>
	<CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
	<20261106113946.60c6c5f6@kait2en-mbp15-1>
	<5F81A6CC-46B6-4C45-BB05-8483057EEE7C@chaosmail.tech>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_070656_144213_A0A92908 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 11:53:13 +0100
Sasha Finkelstein <k@chaosmail.tech> wrote:

Hi Sasha, coming back to this after testing

> >> You probably shouldn't, or at least base it on v2, not v3 (that one
> >> ended up being a bad idea and caused firmware timeouts, so Asahi
> >> downstream ships something more similar to v2).

Linux doesn't keep ACL link across sleep. The core disconnects all
links before suspend ("terminated by local host for suspend"). I saw
that with S3 on the BCM4364 and with s2idle/s3 on the BCM4377. After
resume my headphones reconnect and my patch sets the priority again.
On the T2 Macs the BCM4377 BT itself does not come back from
s2idle yet, even with patches 01, 04 and 05 from your 4388 series,
so I couldn't test there. Would need to investigate, tho s2idle is not
my priority right now.

Since connection time works on these chips, I'd keep 1/2 as it is while
being open for proposals.


Andre

