Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B41860700AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DpsYQ26Y;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dAg9jJSa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=; b=DpsYQ26YNZ5aRq
	WP1lj9S1nad9FfRE5L52yvtr6Bdnk/xuXI5XGVj7yXNhVUb0Yj3rx2RNGroIuKKo1HsCzeoKOCbY0
	P9Zb7bGRYtGswfeP/1jSZ7nNIY0CLZ9WaIyVXw7kwQ1lMsKtJU3QdiRGbPIjslE/7zHSJYkdsKr+J
	Sa8PCfAT2gM1K1M5YBGe6oOXULw+pQob5Gv8i8IIKD7Jmx20W7L8uwZ/FwUqut/kOT772rwCqrBgj
	REnBIxPUUuX7cMV6cvUxxXC9Ui5gSLbrbrQiFvXAgIRf7h8R1QTXQeVhik2zHeQlcwJoUIp1i+tNo
	HC83lIasMmqEjnPydrbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGa-0000000BKcI-2Tpt;
	Fri, 13 Nov 2026 00:35:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGS-0000000BKZ9-3Afv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:35:37 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-492f563d1c6so208125f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530135; x=1795134935; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
        b=dAg9jJSaUKWdHpKfEjFYT4dBXyd7vMVbS7+76yb/JIxAphW8Z7w+fLF03Z1VTNRB4o
         jQqf/vIxWj8wELSKH60TkBgauMEMDtrXbZcla4qrJ4etU7c3TmarCN7PXzjCXg8EhM3T
         sk5UWpRf51cExLGjzGfpHiZ7BEEcOOCewv6yxY3s+XDBmfDucEmOO+8tnnGsqqAj2+rf
         4FsXHVUoofWnCXaZ12wKJc5iXfHDSDND0ElibXcmU+ve4HTTx+3gPU16yc94KRc34Go3
         kYzoY8JKePSC7H4TWhem2G9kqEuKQfAPWirEi6DPz974gzNE7MIuXASXCv07eOuln99P
         8Hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530135; x=1795134935;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bo6GRnWsPzDKJpIy+O18mYadrppy/33WpVxw6zlhaBU=;
        b=W5mu9WEjhzj+GChEoIcbFJ7yz1UtSL/9ODX2UmiV5rxa2UPl5UGSzxuR7WvkIC6HRA
         wcThovBd5QGdkIP7EalcnQ5oFKC1jieTXekLnC3c88jonmQh29eo31lS1DmDFED0mhBt
         nZ4iC5I/r+Mi3tG/t0RTiUKsPvxbx7yRirW0WOQF9BIU/XsLZVEba2tOaTv87aQJvJ8T
         I/D02Y4q+vqibeAlqkgSOPkwndVTPNWmkvSHCqg1VQuhd6HFpjaXzK6dtNnWHZdT1fAy
         NREL/n+Oyx8fuEuV6nNK/Wj61VXuix6sUo94/zekc/Isv59kc/wVH/vG4huwQPtjUqXB
         dB/g==
X-Gm-Message-State: APuU4Z/1fqEkI5txiNV+JrVf+qnFXnIrJEhHdDoZ5nrQHQlfsq9VmEzR
	5ubiUjy7KkA3joXv/URpBkaZPqwX3oalT0j9jw5FSLDY0nF/AXMdB9+L
X-Gm-Gg: AYBFou0MZpbgcmSxptOJRM3idzrPC7hKaSyBXHVyOsAXYo8zHahd4pe6AaH6893omIE
	e+eQPsXTeb2wvH9VaC7S4c+Rgykf/qaD4EOlE3Q9GBIMil7YqdXNLJlQhTpfT3aw9desoqVzi6r
	yN6slH1b7484z9/CUFaTPxhW20Bu+5MJC6iOv2T0phuQeX8OtjsxROQOm20flI1+zUBDABzAi1b
	E0H6fl+jHFtJ/x6Stl1s+sxd0w37pMiyzWZ64bF5Erhm1y1NpTvLFXlEe4nMyAIf+BJltZnGFuO
	igslaZhqjj6G4rlk/SGzUt9MvtTyGperaNbBkWAzg8uYiP+Y39P2K5RLAJbp+mMUmfo5xAJawqO
	jGjxEOjX8MZnjV3R7TbpFC1w9/WszT5NtrA2rt9vNi/XuOwtE+wBUnPLctosDfH9Z2LR+0LrcmN
	pt0bOlFijkxlujeDGsVkC8SRTDhBuhDdWz9u83M7Lw9X0eOa/z49dQE/AHv7i/jpWnJAcP6Y+Ud
	8zIlNVoMfK4ou3TrEFcRwG3d8FtX6Y998Zk/MI2rtQXtyyWgf7dI3EKt6wons/DZsJVqs7yTS3q
	y57W+a5KleW3Hi9BV1eqdkIoPp0hjY/QMZ32bPmke47DPN2lUgfP6dCsHQv/VYkAOez6Ja3T5e2
	umDZKcthGei4uyV7RXSv54TmUsM/a5Nzcwno6e6hv0PHXNpVocqu82oLs6qZyoXcK7YY5X9rLd+
	orNq0eLUODMH0nj4F2
X-Received: by 2002:a05:6000:1606:b0:492:820d:107e with SMTP id ffacd0b85a97d-49c72f7b036mr1416827f8f.47.1794530134927;
        Thu, 12 Nov 2026 16:35:34 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c18b9sm1703515f8f.20.2026.11.12.16.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:34 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 06/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Fri, 13 Nov 2026 00:35:33 +0000
Message-ID: <20261113003533.3660311-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-7-ghahramani.navid@gmail.com> <86bpNzKYRniAzc8v_5Lpqg@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163536_817349_4FB36E3C 
X-CRM114-Status: GOOD (  11.42  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Stefan,

Stefan Dösinger wrote:
> The comments I sent for v1 still apply to v2 I think.

You are right. In my reply on the RFC I wrote that your points were
done in v2, and for the clock driver that was wrong. It still had its
own PLL code, direct MMIO and its own lock, and the resets were still
in drivers/clk.

> Please try to reuse the infrastructure in place for zx29. Ideally clk-
> zx279128s.c should be just static data and a minimalistic _probe function that
> invokes zx_clk_common_probe().

That is how the next version will do it, on v7.4-rc1, with static data
for the regmap clocks and pll-zx.c, a short probe that calls
zx_clk_common_probe() and the resets in a separate reset driver. My
question about the MFD and reset layout is in my reply to the cover
letter.

Best regards,
Navid

