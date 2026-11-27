Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33792606A69A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 14:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C2vrORtk;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=b4+nxwKv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yvkfGtZASSHBZAU+r59KnhIyIeV87W2KzYtyQ/PUTgY=; b=C2vrORtkWOfbWr
	29ulOpKkoq1CxJc3QblXH7z7Q2TDPmKacPUiB9/jv18vrT7865wCKPxr2p2XMEvkoGh2eflJfZELL
	ScATs9ypZ09BeCIvIQI7MVfdye385xvoQ/YCQh1Drco3iuvKwF5qhhrZp84cpcNhed3yjYyOR6M91
	6jWADhW3tmCw4Wg9nBU1lsgTuruZlFzHHwWPAquVLa4+gf+nQk2bzSwZqRxu+5vsTMnLg2wrl0BZJ
	xWNAmEBShh2jWLm4oTn8RKPSPesGPqALmDcaC3Rg1rRz9JMoD+S0FIDIH9ETYIF8DliTwuHX4uUJg
	EJZoKxP/VZCeY0uoihUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx0h-0000000GYkG-0yRJ;
	Fri, 27 Nov 2026 14:33:11 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWx0d-0000000GYjJ-1SHU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 14:33:09 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c5127c7abd5so1248663966b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Nov 2026 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795789985; x=1796394785; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yvkfGtZASSHBZAU+r59KnhIyIeV87W2KzYtyQ/PUTgY=;
        b=b4+nxwKvgaoqcyeoBA1sxQD+CPUWDM1Iw3wTI0qo78HxSJFsLkgbgdTLLkv3FK+ZSx
         ylmKD7NMriRf/LEYDmlR9c4QksvUiD4llSQZBhVnqOeRbEesBvSl6O+PaIHWlcNblJY1
         xYJiDZYlV0ytaPVBpMSN9JqHLSrGYrTZfcm7AEzqDrj5v1vJJPGZfHnzyHABMgJwKRM5
         aSUWTL0CWuRqa++RaWfC5TEFT7fKkUHezNonXnx+mAVg9H9BwnRw2cgnq+oY1X6WGYPQ
         3e9QQ4muhsCpuHfOvyfANb7fVr5gFd2AOoVgXtzV1NwFRiHZpMLZsKtBXL4RudzHVFhs
         MVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789985; x=1796394785;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvkfGtZASSHBZAU+r59KnhIyIeV87W2KzYtyQ/PUTgY=;
        b=BZUPDNs5YdqIOTo1ftQyVciLsy7fPbtbe469njjq4OEeYeDbPhUS18RVX1VaPiEYcB
         P5nNeYjVNpMVKK/MH9vS3y1wUh4yZGK0B+L0cFCn4e6vL2sDoAlyALmKyzOv2gA9yaOz
         g+rsvVhs4FEvUoXdWD0wKpo/H2LHWD1YvlwzwZaewXDR/7xnyOrdRlNESJ6sKmagwBnr
         ZHxuRVb7y5jQy9L15r00TpwcDg5awy3eAPD88rZ2zJ3kwpJHYyawTy8XjO15g68PRe4t
         ZXPrElGLcJDnmsMCWJH73IwJURpXUPtLbU44II2jqxv3C6MvH1oK9EV35sCgZzpG9lEg
         0Mew==
X-Forwarded-Encrypted: i=1; AL+hErFtDrQnBAFfXuBnFfhj6qMAWwe4AGnt7Rb21OJNW9ylOJJQPRke5YvSdNv80PfNJLfa3ExFOLTaYfvuODT6QiIw@lists.infradead.org
X-Gm-Message-State: APuU4Z8xj0okuRbeM9GJQ4SivQQMvNKwPPEo6Ir86O0maNzcyOnYque4
	jUAiViQ0z84xQLDspRhx7W5FrG1X/dl9NbO05sUZchT/tQYkV4gH+RskUxjk1DiUuME=
X-Gm-Gg: AZFdTZfhPP5rOTZBxq0I2MRI+rKCD0sT2a4zQ6psIaJBp27FMJpCuAHu3C+Zo0YPF3C
	lw+WfiS5R6mRh42kTtYjpzY3ohOuoMv7XCSqQXZOR/QG5d5i0JgPnmn5sqZFVNI/dbfrLn14Qtn
	LRQVONul9EFJI6OhLhL2ANrnC/AHyDldbN945O4im6ecz7RpFQgUUgVukoYHeKrJg+5h3tHTnl5
	lo5gP+rWZWm3vPfhYH3yu432ZPLFU8kdHvQZeEoLUp3PDpga8v4RkNhpFkLiPjYJ55Ve9yUkyMD
	IUQOJEcYJ5Gs5e2LsGWoHsa9jMci2rKVOm9aQ6mBnJJAthkkxxFzCYCCCjv/4nvQnqdfQsHYWJY
	8TZjcqAHN4Z1hVSeKRI4AQPdgqruerLIC/6ChR6xMB02//gIwxhce0ZMB+OT+2iLNewGR1KShwH
	Kx+bXtYAKM4eSwaBGSMb3QPwf/M4yRg7fpLZMJQAmzL/v1UbEFYM6pi6ZEtr6hYzOJ3uAhzymow
	1uPvuxJ8Cp8XhZWGLYrW1wTP1pO6Q5KN64B1oNW/6umM/z+UVpgd1gWaUSANppHosDosbBZunH2
	4hA9CjWOvwBrQeD6WUHaYnlCJDbaJDxiOL/VlPihJ8i2CFCb
X-Received: by 2002:a17:906:4fc7:b0:c51:37ec:380f with SMTP id a640c23a62f3a-c513a1df6e5mr2037268466b.0.1795789985506;
        Fri, 27 Nov 2026 06:33:05 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm897225466b.25.2026.11.27.06.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:33:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: nuvoton: Manage MA35D1 mux clocks with the
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, sboyd@kernel.org, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, arnd@arndb.de, 
 krzk@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
References: <20261126-a35bb25eb5-u10-0@mail.sdu.edu.cn>
Date: Fri, 27 Nov 2026 15:33:02 +0100
Message-Id: <179578998230.3130490.7646408699296668212.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=576; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yEJ5axVOhIe7TSERqWwFegn8KRpdTXframG86k/ZPzM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmcU+b7JprGfZRm2i36dFnfb99zzCWRhzqFTLyLtvUGn
 VmdKOzTUcrCIMbFICumyFLDXS3+TlLry6zpOrdh5rAygQxh4OIUgImweTMyTA2Sv/DCe8I15qDA
 Va/XKMw7EqwYUPpg2frZGsz2vgv/VDD8jzD5/EzcvjwuM6zjydsDVl0N63jPcPeJczn/2vVH7cF
 fHgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_063307_420727_984327B4 
X-CRM114-Status: UNSURE (   8.06  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The MA35D1 muxes remain registered after the platform device releases
> their register mapping. Use managed registration so both mux helpers
> unregister their clocks before the registers are unmapped.
> 
> This issue was found by our static analysis tool under development.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

This does not apply on top Miquel's work, see clk-nuvoton branch.
If the problem is still present, please rebase re-submit.

-- 
Jerome


