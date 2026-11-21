Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9A8606A333
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VSozMY8t;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Jub3IfJd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3bhbT5sSoOacf8FjozZAYDlzsEriGzVZIcNpmoXkHp8=; b=VSozMY8tjQy7vaMdz49BKlAOqm
	3l/wkxh0mSZ8juOBc3kGkHxMgtBVU66+48gogOtdSRY1QAOZ0bHnhUjZRXm+GpofE9HpKBLvNsmEg
	jffgp+7C3xg8D5Kfp+o/c1GE19o3mfdyeFG7twye+Laf4nkYtJP3g/EZqCtM2G5bqrFZTH+1VuEFB
	meOFmRIiOkqpZFX7zirTPkVUicEyOS50pHon9NQm0zowuDFvCJdixGIghKKYCkRpG29eCbyLvY91S
	1Ml+Sp2hvyhS0dliJG/7JALJUJkOSDNhPoAq2ylElJivaXJu1mpHhRgiTH7hXXXKr3KcoW8F3ayRu
	SPTgMiFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqcY-0000000059f-1ZAK;
	Sat, 21 Nov 2026 19:19:34 +0000
Received: from omta38.uswest2.a.cloudfilter.net ([35.89.44.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqcV-0000000059I-36d1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 19:19:32 +0000
Received: from eig-obgw-5007b.ext.cloudfilter.net ([10.0.29.167])
	by cmsmtp with ESMTPS
	id UgU0xq6YdVK9UUqcUxljjd; Sat, 21 Nov 2026 19:19:30 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UqcTx7sRzxqjjUqcTxbqZh; Sat, 21 Nov 2026 19:19:29 +0000
X-Authority-Analysis: v=2.4 cv=bZxrUPPB c=1 sm=1 tr=0 ts=6b01eec1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=FJDGcDrgIeDdKcADFjUA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=3bhbT5sSoOacf8FjozZAYDlzsEriGzVZIcNpmoXkHp8=; b=Jub3IfJdr9jYiubaN6G2xwFAxx
	+q3B3vAYeQvpNYfC8KX+VJjXtobc4972FDFZ61+Qjv7wAYDLl1v7++j3EpofqqLKSPC5G3AWeMYyf
	te3RBnlzGBxY4HDb19lhKa5IpnYCYmpLt6ZTyRLRX5pzHBTBW+pQ+ttP6HlBA1cbPBhJ0U1Cdt420
	KOsspN7qujEdZdNufPD+01H6klpPcP+ov9ZAm95PwPyhr/PijKlLv6NRy1HazwfMs9BPmz58wF8zp
	CwtKvE9P4U9Z8RR3VTWsfFqCDkCJ4qzhuzun/Fn8bksefTeZs8WvG2BHsM45nelcnH8jm20ANwf6b
	q0PLCB8Q==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:60736 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUqcS-00000002aoY-43HK;
	Sun, 22 Nov 2026 00:49:29 +0530
Date: Sat, 21 Nov 2026 11:19:28 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk
Subject: Re: [PATCH v9] watchdog: Add ARM TWD (MPCore private) watchdog driver
Message-ID: <9ac8b2fc-db33-44ce-a477-481dff84e92e@roeck-us.net>
References: <20261121-arm-twd-wdt-v9-1-8118d048cfde@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261121-arm-twd-wdt-v9-1-8118d048cfde@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xUqcS-00000002aoY-43HK
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:60736
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFtTDLScuXXpq5EpmuYWm1pu7+4X+R3am7wC4SaL3wY9KaR+Z3j2yA5HS7YZLI/RkFrvsYNXWCSRzurai7XGFRgz4+deW9wjN7Daylr+2q91pUcJ6yPV
 Z6KE52B55GJZguM6Vci39I4GCQ8ywZprpwTMZ/Ew9+PnIGfxve8DLk5iuLnyiQPvAuJq6qWvFBYh3cdAw+eL+GEGLzfFqjREZWwb03pPelZU9sqVVgDBfzwV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_111931_805660_2ABFA99C 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.1 (/)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 09:51:29PM +0300, Fil Dunsky wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> ARM11 MPCore, Cortex-A5 and Cortex-A9 MPCore systems have a watchdog
> next to the local timer of every CPU, banked at the same address. The
> binding "arm,cortex-a9-twd-wdt" exists, but there has been no driver
> since mpcore_wdt was removed in v3.11, among other reasons because it
> only ever programmed the CPU that ran the ioctl.
> 
...
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Applied.

Thanks,
Guenter

