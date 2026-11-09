Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A346606A321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 04:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYGa8rCh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tiIbbLf4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=; b=eYGa8rChvk9R69Aswby8xOOp5D
	T7O7yMGWfJU4BiL0+w1OIRKt8+h6Ua+pPJYB7UfGaTQ10YKUcaZnaUgLy3/jkGrLPHFu0Scn10BaU
	orsFexOoh8iv0dxiBHzeMQa2jXMZUs2SjRUzdH0EGd6Ow7uCrvqmunSmu0JZ2T1ohjvqn7np1g8+a
	SYc5Gm9mg/hs0Ta5UESdXXt9sIxvciPFEI/SxGEeBMGcTglZQ43Z+6qoMeUEXIBIgX8FMTeTTZcK2
	mv3wc1/Wci2Bjc9aAn1635u3v3QLjhkoFtn5OYEQdHtJ6afWLeXx30oYA/XvFOeNGb0XsVvETqHmD
	l8jmvtzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDE-0000000HKrm-3hbT;
	Mon, 09 Nov 2026 04:42:32 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHDB-0000000HKqP-3Zhd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 04:42:31 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so860887eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 20:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794199349; x=1794804149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
        b=tiIbbLf4lMu8A7kpIViP0ULaNLWu3NAqDel/UKN5XrYbXJ5oMkzyg71dfs4JrWEgRa
         UmqP7/x8MMcDrEgRiHfaocy3KfnEq+t/Qu7InmlrFoUB+DPRaC6xal+689/yphgllJdF
         CQcQF8LgairFZOuntIprKIJjzbu+EVOmZZcQAG4pQhY4HRgoPk4CwTizNBAoJ5zHIRs3
         /ZIL45Gld3pnPsjKeQXntH594XUCoVUN86kqMfSyhJSYEf9ys+J3eybObAhqIm1XE30E
         hWsKVic1+c1gZ16XMENpBDY38VmcCcwJp3s7SKltVRwQciApReNoXcv737OJFTvhiWAJ
         k49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794199349; x=1794804149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGLgpUjp0TJQzDOLsYW8InDECLAZK5y2ohFSm3d5WTc=;
        b=Az1CpLLjW7aV1z2vTAVlE4Ly9fOwmLU2sfkouvJqnjZouPEG5OkpTDm5xdNHDAYqcf
         0N8yEK5INqVNlKNE3ussz67qM8mSJnUYwuRLn8KQe2YwIKiKwQA+9GlFO9fGaPl9YDJ+
         mIl9nsY5Gtz8eya9PKyypnx+t0K9phk3lfJus5ozBjVPEAPhVnC4NDUU5TDPuMavxkV3
         hVK6cv7gvkcPlcq3Br9K0lP7XKxKAxt7/3VIKk1ipm2dX8KMIPlxBrDrtMqZRcJimXsc
         2TWus23sBPxL6TSoaOe16HC4S3dfcivnOGT6LGjVF9dStX/Jnp1jku4n8xIOx70Pbhpp
         wUGA==
X-Forwarded-Encrypted: i=1; AL+hErGOiSfk3m6NYiV+XoI7+DvQNxn2JD30/XyoWue9d4WVHemqQ00IoWIUHeDl89499F5L4XCb2BaGWM5X4jXCEkP0@lists.infradead.org
X-Gm-Message-State: APuU4Z8kKgaiD5R3mjzLf5u1blD2Ms4qlLD4OYnHK/M+FSi1r0lmRiGF
	RpE03k7unGGJc5a8ae6hUDki4RRUFLUIaU+ySOfo2fWBeKJ/9qC+Bi4f
X-Gm-Gg: AYBFou3lTZOEexy1d+nQLeR5+1pSTgGvkXKO5KKWFN5mV7NBkBqX+dIL2Ir1lDb0Jdw
	RYxPNrt9ksmRMcLMTfSDfz87w6GA3QPkeNiruymCXjegYEssCXARO/QCQYYoPZy4wCTydGvWvvE
	U0zVm4QiZzeQDLbK9YfWIbZLdmzydJLeAcLwOJGw9cFLPl/Glnoj8wtTAcJpQWZ7my//AtlQB/k
	niXdNi7ZBv/eHtQcLf8nzM+k/mZ8NFKv35UmVhSTUS4i8BEmpnkLpRXpOme7MtZ/sJz/8/2NAw+
	IhfgdQIrJH46sKQh5O62kQ5DQ+9UyYCovx8OYj2mCvUkb4cZ3yuPvPMHCGmQfQrMgE0ijQsj/I3
	JdLrLd/n+qFVZ1wV2IR44SXgrJe2cPeqTPRDXfXHU4cXurc1XojDWTfGu+AIPUB++CGFa6T4Lyt
	c0z8q2KFN26ltkv5e7wQMOMTsc8bDgk67FQK6mCA3T6qUF8m70TqjwnbRJgxjgO9Q0uf4SWUN4Y
	vfg+I5PQg/hO7MkXzC0EUtqiaMOUHYJvvT4jMGOCwPB6b+ZMPPIGr+MJhaKuv+sxlprLq0nU98f
	TpG/JpsxAW0NECm/uMQsuGl6iuu0vD4StAnc6s/1smkF8BaOHuBOIsCp36GCtFtHsscWNQ==
X-Received: by 2002:a05:7300:c8c6:b0:369:f420:8679 with SMTP id 5a478bee46e88-37257d9496emr5721564eec.38.1794199348727;
        Sun, 08 Nov 2026 20:42:28 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3726561851esm10154026eec.4.2026.11.08.20.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:42:28 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH v2 0/3] power: supply: fix work-vs-devres teardown use-after-free
Date: Mon,  9 Nov 2026 13:42:09 +0900
Message-ID: <20261109044212.1157357-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_204229_895558_166EDC4F 
X-CRM114-Status: GOOD (  10.35  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

Three power-supply drivers register a poll/detect work for devm
cancellation before devm_power_supply_register(). devres unwinds in
reverse, so on unbind the power supply is freed before the work is
cancelled, and the work's power_supply_changed() then dereferences the
freed supply. Each patch moves the devm work-cancel registration to after
devm_power_supply_register() so teardown drains the work first. No
functional change.

v2 (thanks Sebastian Reichel):
 - trim the commit messages down to the bug and the fix
 - drop the inline comments
 - no code change vs v1 other than that comment removal

Hyunjung Ko (3):
  power: supply: ltc2941: drain poll work before unregistering the supply
  power: supply: axp20x_usb_power: drain vbus_detect work before
    unregistering the supply
  power: supply: mt6360_charger: drain chrdet_work before unregistering
    the supply

 drivers/power/supply/axp20x_usb_power.c      | 10 +++++-----
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 drivers/power/supply/mt6360_charger.c        |  7 ++++---
 3 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.43.0


