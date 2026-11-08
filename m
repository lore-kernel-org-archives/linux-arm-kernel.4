Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AF5606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 04:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y1hkq1JE;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=j/fPd0cp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8VwTVjzVBE3sZdY/bqGZDMPlbD8bcC2MNX+1REQD2iM=; b=Y1hkq1JEZ8FAzVYADNsUGN68ow
	wiYwoKPSj1awF0HGiCcDM/psqR4F6B/UGybi+61rSY3au4gxJ57rFOG3UXpBNdk2/mqPUBiHHYxqs
	JptYgWsi5pZ2RPQ07q07GgxpV1wY8WhUH9GzAUlKe0XucxAZXINdpbLr0HqE+sHPIlgyFlT41yRMJ
	AbHFONWSN4qvBnCKG3G+BijJ2yq5bsyjnyI+DmfKDKqNNSOuaa6ruwJqLluk6eNA0rc2Y2QETF4A7
	Xg4S5nml5EzrIDezjh0dR8NN3WeTtRBQJkDuND0RhFR76/8FqaHIYIOr1nzqJpd5Lj1K9TBggvaQ/
	KAxUxhNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPuUD-0000000Ffr5-1Ltj;
	Sun, 08 Nov 2026 04:26:33 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPuUB-0000000Ffqf-0tM4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 04:26:32 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6707940E03E4;
	Sun,  8 Nov 2026 04:26:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id iJlV_KB44njB; Sun,  8 Nov 2026 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794111980; bh=8VwTVjzVBE3sZdY/bqGZDMPlbD8bcC2MNX+1REQD2iM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j/fPd0cpOp75azdi04OqBwaDYMDz42+uOx7jGukqaYL6hEkmvaSknKfH/L/NnHVAS
	 zg2MSzp/1D7mtAUommgMgudvBaV93xQl2op+Z3GWaPmqH789VF6YoSYKO3IrjXU94W
	 XuykEaIKKW6CFpzhAL5ZI53K4XtAASiSRPG9xyQEx2rcNE5aVy3mUx/uNc/N+8Pzkr
	 malm2kWVu0RxSI6QZLFdViOkRSnInwWu3nS/VOV8htzR2gIuAkl0Wzvi73Nh22im5e
	 hrs7ipatT+6HaExvVM1AvnuuKwjC529EKZDESXbcGWuZxa6Wf0MsI498ibURbkQStA
	 yrTzb6OqY1IRGxLaynj87/34z9RHY8zCRiG9p9R9Nkf6+2De4VzGRdQZtuHQrvbDMT
	 MRlS00NaOpXBYNRY916hk2RpChIMJUzm3m3ZO9lBhg2fXBNHykXJBZmOCIA8yhzkdy
	 hzBd7K5TU6peqS7lfRctFM4u9yeRCnHKBad2wK9Vx5RuXZKcWXnfx+rs1wdcXZLc9c
	 IXBSG0WU0m6qbxknguYzFejbsfKcvtozANdRr0/7ntAdt0LMI7IzbLo73RC5iG3KWd
	 mQOtv8jZU+dkUhXfrgc1z5TrQUtygVXCtVfoIW9TIS2a0T84uUQV2kyxuXRj5N7/aw
	 zpz/lOvcIgb/ADvrBhNC9yOg=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A28EB40E01E1;
	Sun,  8 Nov 2026 04:26:05 +0000 (UTC)
Date: Sat, 7 Nov 2026 20:26:02 -0800
From: Borislav Petkov <bp@alien8.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Tony Luck <tony.luck@intel.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v5 6/9] EDAC/aspeed: Replace regmap with direct register
 access
Message-ID: <20261108042602.GDau_52vqJcQSrUAf0@fat_crate.local>
References: <20261007-edac-v5-0-5c31fc5df4cf@aspeedtech.com>
 <20261007-edac-v5-6-5c31fc5df4cf@aspeedtech.com>
 <20261105045635.GBauwMg0oqd2tVPH-4@fat_crate.local>
 <TYZPR06MB7920FD1C150DCB201DB88367F2742@TYZPR06MB7920.apcprd06.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYZPR06MB7920FD1C150DCB201DB88367F2742@TYZPR06MB7920.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_202631_429888_C40EBAE9 
X-CRM114-Status: UNSURE (   7.21  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 08, 2026 at 02:01:45AM +0000, Ryan Chen wrote:
...

> Patches 7/9 and 8/9 follow the same changes.

Ok, pls use

https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git/log/?h=edac-drivers-aspeed

to put your changes ontop.

> Thanks your help.

Same here.

Thx!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

