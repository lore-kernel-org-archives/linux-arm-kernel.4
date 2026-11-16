Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF5C606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 04:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PXyuxSUM;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=EzqouExK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FpUz6VKa8cvlk6B0dGTvOD8cphJCOZqOzq+OFwLdeBs=; b=PXyuxSUM1s0FUD
	erHzGglAmb4dueiv5Dy08dORkTBx6db9pQ/h07zoUcd3otRN2HMhv11rEd2PL4ASlSmshSyBj07mr
	YyFQZSO1cmt5rWLZQZVYnmS015INh8WXV7QeoIf91Ff443OXxrARzCHDIxZhX5BVc0fXJcUMYLuh6
	F21B5F8f8mHr3MilPxj4cziKyNSBt+QoPhouiP9a8HzF9wdYQSHLuypq1NdMLXlyE2DSfxNKVqfsA
	4LsHiTYsrqhIfUDi9m8Ew3oSIeGIxHboJT/qqv754PTSVDP7ymYAFuzqThwaseUXbUv3qyWDbX3em
	ehu1se6TfjASEpsYsl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSntW-000000015Fe-1nJZ;
	Mon, 16 Nov 2026 04:00:38 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSntS-000000015FD-3Ypd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 04:00:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=FpUz6VKa8cvlk6B0dGTvOD8cphJCOZqOzq+OFwLdeBs=; b=E
	zqouExKnTvZUMVriMCOwD/uSYdsMP/czsL2DMfiu3JLeUS+3MZRXiGwWpx98Uf+d
	itu6wmCOwZusjspjo+JvlaPXSFRmtYsyQvwrQEYeUrJDQcjmiz5Ahj9cGNY/fbDW
	3hw0Pk3i/ffg5ErGR7V3nj/yP0CquYlMg9taPdK+/U=
Date: Mon, 16 Nov 2026 11:59:28 +0800 (CST)
From: zl020895  <zl020895@163.com>
To: "Brian Masney" <masneyb@kernel.org>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	"Arnd Bergmann" <arnd@arndb.de>,
	"Krzysztof Kozlowski" <krzk@kernel.org>,
	"Long Zhao" <longzhao@ambarella.com>,
	"Alexandre Belloni" <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	"Michael Turquette" <mturquette@baylibre.com>,
	"Stephen Boyd" <sboyd@kernel.org>,
	"Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"Catalin Marinas" <catalin.marinas@arm.com>,
	"Will Deacon" <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, "Linus Walleij" <linusw@kernel.org>
Subject: Re:Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <avReozTC_GEmfIxG@x1g10>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10> <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
X-NTES-SC: AL_Qu2SBvSbvk0t7iiZbOkdnUoTj+Y/XMK0uvwk1YdVc+MGpT/J9BIGcENYL0vb4v2JJgSKuzq3WhJU6vpweI9IrcCebcyksFrj0mpy8H3qeg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-ID: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: lSgvCgBXl_egf_pqETJvAA--.5849W
X-CM-SenderInfo: d2oqjiqyzvqiywtou0bp/xtbC7gBh0mr6f6DTZgAA3n
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_200035_312783_B327811F 
X-CRM114-Status: UNSURE (   5.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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

SGkgQnJpYW4sCgpBdCAyMDI2LTExLTExIDIwOjI1OjA3LCAiQnJpYW4gTWFzbmV5IiA8bWFzbmV5
YkBrZXJuZWwub3JnPiB3cm90ZToKPlNvIGhvdyBhYm91dCB0aGlzOgo+Cj4tIEhhdmUgTG9uZyBw
b3N0IGEgbmV3IHZlcnNpb24gdGhhdCBzcGxpdHMgb3V0IHRoZSBjcmVhdGlvbiBvZiB0aGUgbmV3
Cj4gIEtjb25maWcgc3ltYm9sIEFSQ0hfQU1CQVJFTExBIGludG8gaXQncyBvd24gcGF0Y2guIEkg
YXNzdW1lIEFybmQgY291bGQKPiAgcHJvdmlkZSBhbiBBQ0sgb24gdGhpcz8KPgo+LSBJIGNyZWF0
ZSBhbiBpbW11dGFibGUgYnJhbmNoIHRoYXQgY29udGFpbnMgdGhhdCB0aGUgdHdvIGR0LWJpbmRp
bmcKPiAgcGF0Y2hlcywgcGx1cyB0aGUgQVJDSF9BTUJBUkVMTEEgS2NvbmZpZyBwYXRjaC4KCkp1
c3QgY2hlY2tpbmcgaW4gLS0gdGhlcmUgaGFzbid0IGJlZW4gZnVydGhlciBmZWVkYmFjayBmcm9t
CkFybmQvS3J6eXN6dG9mIG9uIHRoZSBwbGFuIHlldC4KClNob3VsZCBJIGdvIGFoZWFkIGFuZCBw
cmVwYXJlIHRoYXQgc3BsaXQgZm9yIHYxMiwgb3IgaG9sZApvZmYgdW50aWwgQXJuZC9Lcnp5c3p0
b2YgY2hpbWUgaW4/CgpCZXN0IHJlZ2FyZHMsCkxvbmcgWmhhbw==

