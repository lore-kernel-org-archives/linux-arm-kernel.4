Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2822F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nglgiljh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q31Wgauh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=; b=Nglgiljh5jTMCt
	m/DuYUDprHs8gQ2hfm3WBRSpBwpaHCVr+DGL8qK0GfA8df6m7w794dwlmOhTWtHao6F0WAtXdX9t7
	8kZKffA/X9snOYVomZ58u+15TQJTVB64kCoM11rPh+sBgRTjIi/yAThrtyXLPmB9QaV79dTmNJ+Ql
	9IPooOOHelx+VbhE8DCvPgtpRTdSWNrXuG23zXIVFSdvF4jiBogh+LpZkzk0ArDGfpE+QghsVQMlx
	CXjMTwESk3RpzQkIcEJFwplljxLSfktZWUBCQOLVTkDeTR/teSFlWNN17P3NGGoJWm9QFcbcRlVc+
	DrXdUDxg81ynOcmD1DVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkVz-00000005hMK-0BXI;
	Tue, 24 Nov 2026 07:00:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVkVw-00000005hLz-1afT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 07:00:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso3979983e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 23:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795503626; x=1796108426; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=Q31WgauhA3pfz1Qclngxz+ce8wZQTsYWqStJpbi2UqkRJV9xhHuivUNCjpSmH12hod
         8EZSU9oQ5rUvqgDNNN50+JFVXaqybthy4cKhj/MKmSPIJjQB7l/OrKQYwOVJEY3X6xPd
         DcJA6ifACPw0sTY/3Pb5txbSLkxL7XpaE+6QzpKO9YUlt4upuQEVZXq0RkM2dT2qdszp
         KpDTsburPQauGNTBWuZ7qMfUPX9NiXtV2m8KvfJoKC1O8aYw/hwUwbPbX7yCwUYCbadz
         n1W/CT/ToPdnuB5P1b8RT6yXILFYOPzI0hVgt9x5LWHE5cYFj85/SA7Dk5w4WcgcOqBg
         Nc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795503626; x=1796108426;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/NHlIq3UE1brmYtkqJh/mfk9i/Bh0D5vF4cK6kPHqY=;
        b=F2xJMnb3mTjxz7e9ZpSis+M9JtU17ZqIVUVZu5eT00KByHQAIA/WDqQZsRmH3HQcTc
         avUt0RvxahhYKvKLNKsUa4aFVe/usZ8ZhiSyHJzvSqH788vWFmJ15RQlGXESGJwulAHa
         agtzDq+vjZ3EWvPVG2gbUs+UBTybsoZ+jrkOq8E10XSojrs/pReAOrp1sV2ldnfndPvB
         zdQ83UXhIcDmHz62+JaPCCblQbaHB0/Ouw/NYZ1xyQyX6uZykYNxmcw/3gAPERHwQrFF
         oDAYMGMnaurRm/+0zjFZkmkCwvja79XAHzMzxRlIY8GTgq1uIUO8JAxnIEgvDBPOfvkf
         n+KQ==
X-Forwarded-Encrypted: i=1; AL+hErFQska1oIqklPQ1cJSmobbBkmdv18H4nBprsVl8el//8lu0lALrNr7M37yR6Y9IWFEJv+LmManfaGUFznhKpQE9@lists.infradead.org
X-Gm-Message-State: APuU4Z9ewRHmedDjQUtu6K9ZF2QGpQKqhUgUEYjC/Roy+mSE70kKnxZE
	DdDL3zpKXrMzTV9neir1AxHhLzZ94zOYRMxIeWqRU97WfAje43B+pfck
X-Gm-Gg: AZFdTZe6x3vNmd+6eS3mouVc+9tCMNjJWpQG3DCN0mugkahJQLoIpdUJ380YiI6TK/I
	qJsP8xWJeNMOOqQVEjPKxPy/p23gcmpX/BEmIQa1eyuFsUoWmvBnpzhwWV+QQ0Bxw4S0FKbjIHM
	sTrbcB2IIftdWWqVCi1iN2VP7G/ae+epHv5Ga80T2HCjuASAkadJmFpOpoFXv9wc1W61c3eCZn7
	ZDlIvWgpc8SGa/5zWvG9wVqxTfMplISJWwPRCYZi3EEcs5F+I9JEJQeBuJV29AXxSNYP/MxFbJu
	zphdhsbH1hC3IoLS8IMbYbU5GzX4b2AgO16pc5lFjOQdM8g4/JbW+sg+qL0yvb5bVj7wfWnGPLS
	yEEUwXzwQChLY6HwuTCV2fBhD4klZr7sBUiwib9NCxq+h6RZQ+xycth/6LUwYk3Q8l7+aDm2imu
	MT2zmCZTX0oMgQ622KnY0VvA4kGnJT3mGrAsuDkGjddM6BaR3OfV/iYE9xw450Bh5BSeWCturuK
	f27dexwaO5WYzpkRQHYed1GAn/Uoq6vHkji/uwKvhaDrtoJIZsnIsatzWR0j4LQGhRIHPqQbv2W
	7Fmlt1EymmlEaHJnovJLIiv7QGVWyWlUXILSeXAorYBmwptfRkHQO9k=
X-Received: by 2002:a05:6512:23a9:b0:5c1:ac60:14fc with SMTP id 2adb3069b0e04-5c1bc7c2ad1mr4864356e87.19.1795503625540;
        Mon, 23 Nov 2026 23:00:25 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcf33b5csm3615530e87.8.2026.11.23.23.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:00:24 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: Add Cortina Systems CS7542
 global control block
In-Reply-To: <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
References: <20261123-cs7542-syscon-v3-0-f1c07a1703f8@gmail.com>
 <20261123-cs7542-syscon-v3-1-f1c07a1703f8@gmail.com>
 <7bce0280-704e-42ce-ba65-d3ab369bc20c@kernel.org>
Date: Tue, 24 Nov 2026 09:58:48 +0300
Message-ID: <179550352883.4.9894258481538485863@gmail.com>
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_230028_429067_02C006A4 
X-CRM114-Status: UNSURE (   7.36  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

Understood, and sorry for the rapid rerolls. I should have left time for
review instead of posting v2/v3 while the earlier series was still being
reviewed. I will collect the remaining feedback and avoid another
immediate reroll. Follow-up fixes will stay in the preparation branches
meanwhile.

Thanks,
Fil


