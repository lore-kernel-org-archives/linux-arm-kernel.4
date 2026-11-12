Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03A606AE54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWDCdMzv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aKLjmuIU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fSSCkqvwTZj1huGL8Zl26siSAmzWWRmX0EP+FjZ9eu0=; b=sWDCdMzv7AM5cq
	5ywFLkkp5yYBN/57183syMZiHH9l7GKiCq/5VCDuMXdxFgHY2MQzWMDonK/GHkJcbnIClXD8qXV0n
	0y8R8V1AkzdjncEkOFUGiGsjT/37lInUpLI3qRQ68oHpZPZ03djf4VOnnNINsRXEblP8ONFntgK9a
	Bnrhsm/h/Xe0e0UKMAPpVVzgayFCPikN/xc2lcQcEJH3/MSsTNEXGvdXP74K5ZOMoW9eBrWa/+DaK
	UEqq7kkCqE9GYH3ZFliKjQyzSJ/Cn54R4zty2RBytxA8ZSf2Rn8LP9fLk7V8bhs3fCyHJtDoJSGC9
	/9Z5Xh73wyU41Vzv9kGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdh-00000008qwF-3esf;
	Thu, 12 Nov 2026 06:50:29 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdO-00000008qnm-1lZG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:50:11 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-37628596783so3776232eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466209; x=1795071009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSSCkqvwTZj1huGL8Zl26siSAmzWWRmX0EP+FjZ9eu0=;
        b=aKLjmuIUEjNCWleMkZmgGcZmqOgUtEl58RO4QrrEbpprY09gBmllKTT5DiOBsa1zJA
         CHVYzYWu2IKfwI/bPszgp4itAY+agVjIGlR+4h4rEMm9J/FDJw2YHAvYtW2G4HCtLjHt
         703lPvI+1TdHLdQwtkdOTB94Gr6FXjMwsTxkdMinu4WEWzQGoFtUFFGVJODr9eTs5i0b
         HydqQCt4OSYWY7xixP3qe4jQClLL2wwRS/MLLFBXJMjaI9YXujkvr3wSvdp4RGkMsRsY
         rm+UrjwQx5zlMVh9Mf6Ki4Pz2tlRNoXlyNWlGuQWWWFKkFWC00Dsvi0/I8uFGcjEBtn1
         2J9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466209; x=1795071009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSSCkqvwTZj1huGL8Zl26siSAmzWWRmX0EP+FjZ9eu0=;
        b=CNmAM0fHGb+ZoeTD5b+WmwRsDTfnYjWvVWLYARJ7zvQ0qfpraaSyqqSZ8RZ0yv9xO/
         g+7YPkQYvdH8zzJmO7zoRXpBNjFE79+mhHQD46q7YPzkvrdBevRXtnmdvUX2t6WZKrkt
         iQwcUd1G0fkF1Yf3DHa2hSFvcyQ1vKOZBor+jvh07dqfsFMpeWkeh5lJ32TrLfWjlDWu
         DWTutPxrRsYQ23+zTiQ2AY6tsP2hRhI4SLBAJ7mAqTDnlVJOkYPeWewpq64EjkXlQvI0
         6iHvy7VyZPPBv7hIAf5CLBJs63x2G40dNByPf7OkyldPyWNdZdhC2DB2vCkSxV8c6Q66
         IHFg==
X-Forwarded-Encrypted: i=1; AL+hErFzchQcHKGasknqdPf0fpFGLBGEdrwsk8AsPfczwCjlWSPKRIyWQlI9AvCQJdtwW5bTwh/fvfMUaLmsEULPBNoD@lists.infradead.org
X-Gm-Message-State: APuU4Z+vaOJXtoDS9GioBMTHZKTH7cspUBKQMENNQrLdRAdNIFtrgWKW
	geNr/9LXYpZ9ZnR9B9nolVmYgAu51oVtPSRUfZGPsmkaTBwzAmR8XIDRFpMXMw==
X-Gm-Gg: AYBFou0CMQWbJViqS7lrExsVHokD+dEa98JApBMBTZhub/5/8ej18Sw7yvhAPJAlDD5
	lc29G4F+DAbkeriNd7djNy9+oc7QWk2XO/aNGu7N+z119AMp355kergXrIHKD0UelI58kJCPT0P
	qJF0IC6ViGp5rXtvMP3H4m9XtEbl72JmLhEuFJ5Qw0b0P31P8rwt2nAWimTYilklf22ZBRn4cJ3
	QZP8StbLfmoQy3Pkav9O2o38CPBxX3+H87fueYU/GQY0HPgJqsCDQw1dWRx85752NtlIUyYIAXD
	m2WQ8M9F+1du9LTO2/HX28qpeI4Nga0xnSdGEPTsIko6ps1UsOJIIMYoYTBe/+9N03EAIzPeKgI
	/9LWgqNOaVbsaiyulFDm/NUZ8mds3JCV5ZxjGGcSsTHvVj39IW9nYjYrX2lUJwP9P1JuZTvbyUj
	myDhkTrx4qHgDOgtaCPzz3pLguO0/nzK5EpvqOd2yoFmsor647MkhpvYqHX461EqaBGYoF+g/ZG
	LkwLEmrGzTbwBzGx200GORupfcJy619MstYChdOlvSYIVf55SxEh+bgH9EjeTBZOHOrTJrsueX7
	/whNy+VvXB5WwWJEOI0iuLUX8ay4cS7dpryKKRO0Y5yxEJqqYAlTgb+2vogC0g9skthZ8oCazcd
	3OLk5KijkbpqUih4Q
X-Received: by 2002:a05:7300:f54b:b0:36c:a42d:9bc9 with SMTP id 5a478bee46e88-37685c7a866mr4653158eec.25.1794466209304;
        Wed, 11 Nov 2026 22:50:09 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:08 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mark Brown <broonie@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Kris Bahnsen <kris@embeddedTS.com>,
	Mark Featherston <mark@embeddedTS.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-input@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] Input: ads7846 - remove unused code
Date: Wed, 11 Nov 2026 22:49:56 -0800
Message-ID: <20261112064957.1796975-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_225010_488192_DF457431 
X-CRM114-Status: GOOD (  13.50  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove the pwrdown_cmd member from struct ads7846_packet, unused since
commit 6965eece2a89 ("Input: ads7846 - convert to one message").

Also remove the unused REF_OFF macro definition and drop the CS_CHANGE()
macro along with its sole call in ads7846_read12_ser(), since the
request structure is allocated with kzalloc_obj() and cs_change is
already zero.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 6352117cd898..4a5a141bb4a6 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -84,8 +84,6 @@ struct ads7846_packet {
 	struct ads7846_buf *rx;
 	struct ads7846_buf *tx;
 
-	struct ads7846_buf pwrdown_cmd;
-
 	bool ignore;
 	u16 x, y, z1, z2;
 };
@@ -145,13 +143,6 @@ enum ads7846_filter {
 	ADS7846_FILTER_IGNORE,
 };
 
-/* leave chip selected when we're done, for quicker re-select? */
-#if	0
-#define	CS_CHANGE(xfer)	((xfer).cs_change = 1)
-#else
-#define	CS_CHANGE(xfer)	((xfer).cs_change = 0)
-#endif
-
 /*--------------------------------------------------------------------------*/
 
 /* The ADS7846 has touchscreen and other sensors.
@@ -195,7 +186,6 @@ enum ads7846_filter {
 	| ADS_12_BIT | ADS_SER)
 
 #define	REF_ON	(READ_12BIT_DFR(x, 1, 1))
-#define	REF_OFF	(READ_12BIT_DFR(y, 0, 0))
 
 /* Order commands in the most optimal way to reduce Vref switching and
  * settling time:
@@ -400,7 +390,6 @@ static int ads7846_read12_ser(struct device *dev, unsigned command)
 
 	req->xfer[7].rx_buf = &req->scratch;
 	req->xfer[7].len = 2;
-	CS_CHANGE(req->xfer[7]);
 	spi_message_add_tail(&req->xfer[7], &req->msg);
 
 	scoped_guard(mutex, &ts->lock) {
-- 
2.56.0.567.gdb80ae8cd5-goog


