Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2816360A2614
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qGbzL+uS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iyr9/xW7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=X/7FVMEXiHBL4WSOz0Pysl4wEd+SmpS1KQgCfjBgAZI=; b=qGbzL+uSmIT7kHorBxkWU3LXyh
	0ne7qYxtCRzgBibMsR9h5lNliwDblnmW+xoRjUEhCMTtng+uEqGDogJh/DGWamaCkYjrjJSHEAHO6
	DsnyXW5FHgg2P71LLq72A4CJ+r2u5BF5urQfU2CM8PI9DuZVPlhXM/C2yt0KrRGoNAYFe/GHl+jbK
	C3w1o/3H9yKLRDki7n+u2M4ykl0T6KQNMv+7MW2O8oyDbR4lle6BGYJZzJqLb1PQo9e8udO0kD3Y+
	Ipb79Z6T2wacfVE8YovifObX2hAO2HNcHV3sdKUUlRrz1znjVVMrrLM+AnDyP/FyAA15Cqf4uFPzB
	2103ma7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47D-0000000CTBE-2ZwP;
	Thu, 19 Nov 2026 15:31:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU47C-0000000CTAS-1DOp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 15:31:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0A6745991;
	Thu, 19 Nov 2026 15:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29E21F000C4;
	Thu, 19 Nov 2026 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795102317;
	bh=X/7FVMEXiHBL4WSOz0Pysl4wEd+SmpS1KQgCfjBgAZI=;
	h=From:To:Cc:Subject:Date;
	b=Iyr9/xW7xxwLpx19/6opDpoSmJ2s/MGFRTUq8pKHHWyvtgqt/6NY81BiQyhPzLFpF
	 bxbG/rzEdIDvdk8tCaVzGBJoG3LuPdOxatvz49fC+WFtm2jzGsIVMrk5GYSYYGZii8
	 TdPgGAEzYjCOdBMmzC2vkEgrqZoS9bWvfpUhRtjoPPJ36IN4kp4g0+eVjNr3wJFJ5Y
	 VAwpM2PeTgakhzKIrg8KrOkekTlO88z/NspyQPtBWsNrcf0U0ijriZivmz6lM7in31
	 fj0TuK4mEswc3lLYMzBRIBW0fAClOZRuT0tb2OIRHqYdzmeQctqLEEhzB7mGRl6n3b
	 a6tiHvkhqbB/Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexandru Ardelean <ardeleanalex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Bogdan Bolocan <bogdan.bolocan@microchip.com>,
	David Lechner <dlechner@baylibre.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Joe Sandom <joe.g.sandom@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux@analog.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Marius Cristea <marius.cristea@microchip.com>,
	Mathieu Othacehe <othacehe@gnu.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>
Subject: [PATCH 00/10] iio: Fix memory corruption, teardown races and bounds checks
Date: Thu, 19 Nov 2026 15:30:33 +0000
Message-ID: <20261119153151.1397003-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Bogdan Bolocan <bogdan.bolocan@microchip.com>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Joe Sandom <joe.g.sandom@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: linux@analog.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Lothar Rubusch <l.rubusch@gmail.com>
Cc: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: Marius Cristea <marius.cristea@microchip.com>
Cc: Mathieu Othacehe <othacehe@gnu.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Michael Hennerich <Michael.Hennerich@analog.com>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>

Lee Jones (10):
  iio: imu: adis: Clear pointers after freeing in
    adis_update_scan_mode()
  iio: accel: adxl313: Prevent FIFO buffer overflow in
    adxl313_fifo_transfer()
  iio: accel: adxl313: Reject sub-base ODR codes in adxl313_read_raw()
  iio: adc: stm32-adc: Validate channel index before writing chan_name
  iio: adc: stm32-adc: Detach chained IRQ handler before removing domain
  iio: adc: pac1934: Fix custom attribute allocation and channel bounds
  iio: adc: qcom-spmi-adc5-gen3: Free TM auxiliary device wrapper in
    release callback
  iio: adc: qcom-spmi-adc5-gen3: Reject empty reg property in probe
  iio: proximity: isl29501: Fix division by zero and overflow in
    isl29501_set_freq()
  iio: light: tsl2591: Prevent infinite recursion on threshold
    boundaries

 drivers/iio/accel/adxl313.h           |  2 +-
 drivers/iio/accel/adxl313_core.c      | 13 +++++++++--
 drivers/iio/adc/pac1934.c             | 33 ++++++++++++---------------
 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 32 +++++++++++++++++++++-----
 drivers/iio/adc/stm32-adc-core.c      |  6 ++---
 drivers/iio/adc/stm32-adc.c           | 12 +++++-----
 drivers/iio/imu/adis_buffer.c         |  2 ++
 drivers/iio/light/tsl2591.c           | 25 ++++++++++++--------
 drivers/iio/proximity/isl29501.c      | 10 ++++++--
 9 files changed, 87 insertions(+), 48 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog


