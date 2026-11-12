Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A5A606B4A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qBYMgnkd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KoW0zKqn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vVhsLL1Pu2n4j4YLMUMbDZ8LRYF6+iKldnx7jPCdxAo=; b=qBYMgnkd1X+yXW
	UIsLB3WGqrgJLmA3Gs7Y+HulImWWclx8hMi1ER8N6bjvYpN/LskqjX4lvLMbi2J7MXV9mQ/YxQXCC
	T3fJxrVMdFEk29g4QoTUYUtY3MAfxF6ywaD6Zx7kPrsMERT6mG0mo6NbeOLaU2szUN7aV97IRoe4M
	bD1Eh9e7oC+hVMIu5fmXV0+LgVziArnE77u0gPDUCbPYefEV8+fyTxudyQENP8PLPeNnQ66FzNc2z
	UKPtT1t7sxcCx3sXopLX7qCW2DEylhSI3fmaiy3H+3FauwAcuqsvw0AE8X7xEg2zsBqN1CFNic+sC
	K+2QAVeENIflXhWYfZ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdN-00000008qne-3niZ;
	Thu, 12 Nov 2026 06:50:09 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xROdK-00000008qm0-3IQc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 06:50:09 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36a315ed211so586393eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 22:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466206; x=1795071006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVhsLL1Pu2n4j4YLMUMbDZ8LRYF6+iKldnx7jPCdxAo=;
        b=KoW0zKqn5VVBArwomk4fU9FWw33LUf4v/BzT/2HuB3mJHc8ktCFH282qrpOj/1QNeU
         t7sBuX+Shx6OSS/9aYhDmMEGQNTJ9Y6Fnj48lzSfdDMiz8UXXWDdy56yQkqEO30QlAeL
         xOBW1tAJl5iI4qlHaK+OZMlO7+vSBczMBbDVGSnqL1XDcBJ4+xzuT1Ou/4FAFsiper5l
         nAKk4EXlurBIxz0gg5DHj32rvLrry1tncySgQq8ju1Siho1AGlZbug4HTAaQNJpbzW1O
         XEKgANYKM3F/tZm84rN5hSqCe1N7w0/Xc4iwm03cALMBVna+nH5KPGq9X+qxdXBVPfRd
         rQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466206; x=1795071006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVhsLL1Pu2n4j4YLMUMbDZ8LRYF6+iKldnx7jPCdxAo=;
        b=Jr9Z9hV3/LgF2lRk7w9rQOV9Zt0AsTeiGwp8Uhw7JYlsokJN6N0ThEmRy7XaugVnlu
         5xOtlgcWQrTJ36vuYp14uuVOFGL+tv88pnrwlwg6AAtLWSp3/G+jzdiasu23AsnrbzSV
         f461omxm0sD6mmKq2ptKDTs8VDOe2SdJhP2BRgcXJm1TM2JXBZLoiWwJVxmNHZM27FGa
         NcidYhnJnluTGbdSl91uRRIR0gCRH+NEhN5tk22kzwVUOq/7aLKzTrZXQ892jU1YB8pj
         yoz2cQB+Ar/ahnZgWAAKZl3Mmqd4j+lVHZLl9XMi7q8phLUIeYULkmBY32+tDbUKHxIN
         0SdA==
X-Forwarded-Encrypted: i=1; AL+hErF5RnU9b+TEDqYqkkzpvuHpt0NdUurFVvqpAvTPYMMMnkCiId3qRLtVqVvVpIxg2YwVap/2BdqmxNhqnOkJ6kDh@lists.infradead.org
X-Gm-Message-State: APuU4Z/gGZbTPL7yMMjEcQV+clHuXQCTXhXAOBAORv5g0d7Wz5C12LKz
	PDTQvFiNgu6ZuTwFajV2OBVq3odncEthWHwnMAPgvrN05CvrL8/r1XQu
X-Gm-Gg: AYBFou0JFoos/I8KHAK4YvsEEQUKmjjc29GdhieyowjbrsteWWi1EW1mISIuXSgDURI
	18xymb6+klhmgHm/AQbM6TOIBT1bo/0z/iMLEqvI+NHXZhuIGjdoiTxhTjl0nJbDnI9Wv/VXRLU
	epQuSig38E5OB085BrlwLiEtVtgnrykyk0BmEr9i+ycfExf52LXE1W7C81W1eMksfDEAH7f05dH
	0xQXGxXTVo817vCJpysUOa6wpXN8CVPgBBpawvlf4TBUhvVUWJuUn2BhcdQ7H0hF0pL8Wp+f5Sv
	8YnOoXr48qL3kAawd/mF14EMsuOZgqfI14lWwAD8MGchCSJO+jw2wRTbwZJo10gEE/jSmr+9tOd
	czD233U/mpEyQFNSwJM9sT7tEP4g2crdYFC6/34GMXPQqq78XbuoTWdvo93eBRiy1tnLsUzXSoA
	bFrV8EgJ3HGjbvrKIo/t4d/Q31bVBjwIGYqFw7yTReTD6zBNkFe0wbhMoMJPV5h/YfKNhIGOVyL
	HustbYN6oUbYMI2U+0CoRTEtpVnjME99iIsD5M9W7STDW0r/Prly+qhmTWf07JPkWOcNpq6BE8Y
	Cb01ZakwfXi6mhPvGGUZMf1al/BHeX7P19xLPxmQu4ZuJ226JJwB9pkw6V/rWmzEkpB4b8KzcG5
	Javjbzt8hmk320qgE
X-Received: by 2002:a05:7300:148c:b0:361:a195:c46e with SMTP id 5a478bee46e88-377de5f761amr2466577eec.1.1794466205719;
        Wed, 11 Nov 2026 22:50:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm27190961eec.19.2026.11.11.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 22:50:05 -0800 (PST)
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
Subject: [PATCH 2/5] Input: ads7846 - simplify sample filtering
Date: Wed, 11 Nov 2026 22:49:54 -0800
Message-ID: <20261112064957.1796975-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
In-Reply-To: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
References: <20261112064957.1796975-1-dmitry.torokhov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_225007_340903_922BD225 
X-CRM114-Status: GOOD (  20.15  )
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

The filter and filter_data members of struct ads7846, along with the
generic signature of ads7846_debounce_filter(), are leftovers from
custom filter callbacks that were removed in commit 937f5d5ec642
("Input: ads7846 - remove custom filter handling functions from pdata").

Drop the filter and filter_data function pointers, remove the unused
ads7846_no_filter() stub, simplify ads7846_debounce_filter() to take
struct ads7846 and the sample value directly, and call it without
pointer indirection.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ads7846.c | 72 ++++++++++++-----------------
 1 file changed, 30 insertions(+), 42 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 9bcb2ef129cd..f1827684c902 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -135,8 +135,6 @@ struct ads7846 {
 	bool			suspended;	/* P: lock */
 
 	void			(*read_state)(struct ads7846 *ts);
-	int			(*filter)(void *data, int data_idx, int *val);
-	void			*filter_data;
 	struct gpio_desc	*gpio_pendown;
 	struct gpio_desc	*gpio_hsync;
 };
@@ -631,11 +629,12 @@ ATTRIBUTE_GROUPS(ads784x);
 
 /*--------------------------------------------------------------------------*/
 
-static int ads7846_debounce_filter(void *ads, int data_idx, int *val)
+static enum ads7846_filter ads7846_debounce_filter(struct ads7846 *ts, int val)
 {
-	struct ads7846 *ts = ads;
+	if (!ts->debounce_max)
+		return ADS7846_FILTER_OK;
 
-	if (!ts->read_cnt || (abs(ts->last_read - *val) > ts->debounce_tol)) {
+	if (!ts->read_cnt || abs(ts->last_read - val) > ts->debounce_tol) {
 		/* Start over collecting consistent readings. */
 		ts->read_rep = 0;
 		/*
@@ -643,39 +642,34 @@ static int ads7846_debounce_filter(void *ads, int data_idx, int *val)
 		 * wasn't consistent enough.
 		 */
 		if (ts->read_cnt < ts->debounce_max) {
-			ts->last_read = *val;
-			ts->read_cnt++;
-			return ADS7846_FILTER_REPEAT;
-		} else {
-			/*
-			 * Maximum number of debouncing reached and still
-			 * not enough number of consistent readings. Abort
-			 * the whole sample, repeat it in the next sampling
-			 * period.
-			 */
-			ts->read_cnt = 0;
-			return ADS7846_FILTER_IGNORE;
-		}
-	} else {
-		if (++ts->read_rep > ts->debounce_rep) {
-			/*
-			 * Got a good reading for this coordinate,
-			 * go for the next one.
-			 */
-			ts->read_cnt = 0;
-			ts->read_rep = 0;
-			return ADS7846_FILTER_OK;
-		} else {
-			/* Read more values that are consistent. */
+			ts->last_read = val;
 			ts->read_cnt++;
 			return ADS7846_FILTER_REPEAT;
 		}
+
+		/*
+		 * Maximum number of debouncing reached and still
+		 * not enough number of consistent readings. Abort
+		 * the whole sample, repeat it in the next sampling
+		 * period.
+		 */
+		ts->read_cnt = 0;
+		return ADS7846_FILTER_IGNORE;
 	}
-}
 
-static int ads7846_no_filter(void *ads, int data_idx, int *val)
-{
-	return ADS7846_FILTER_OK;
+	if (++ts->read_rep > ts->debounce_rep) {
+		/*
+		 * Got a good reading for this coordinate,
+		 * go for the next one.
+		 */
+		ts->read_cnt = 0;
+		ts->read_rep = 0;
+		return ADS7846_FILTER_OK;
+	}
+
+	/* Read more values that are consistent. */
+	ts->read_cnt++;
+	return ADS7846_FILTER_REPEAT;
 }
 
 static int ads7846_get_value(struct ads7846_buf *buf)
@@ -759,7 +753,7 @@ static int ads7846_filter_cmd(struct ads7846 *ts, unsigned int cmd_idx)
 	for (b = l->skip; b < l->count; b++) {
 		int val = ads7846_get_value(&packet->rx[l->offset + b]);
 
-		switch (ts->filter(ts->filter_data, cmd_idx, &val)) {
+		switch (ads7846_debounce_filter(ts, val)) {
 		case ADS7846_FILTER_REPEAT:
 			if (b == l->count - 1)
 				return -EAGAIN;
@@ -1367,14 +1361,8 @@ static int ads7846_probe(struct spi_device *spi)
 	device_property_read_u16(dev, "ti,debounce-tol", &ts->debounce_tol);
 	device_property_read_u16(dev, "ti,debounce-rep", &ts->debounce_rep);
 
-	if (ts->debounce_max) {
-		if (ts->debounce_max < 2)
-			ts->debounce_max = 2;
-		ts->filter = ads7846_debounce_filter;
-		ts->filter_data = ts;
-	} else {
-		ts->filter = ads7846_no_filter;
-	}
+	if (ts->debounce_max && ts->debounce_max < 2)
+		ts->debounce_max = 2;
 
 	err = ads7846_setup_pendown(ts);
 	if (err)
-- 
2.56.0.567.gdb80ae8cd5-goog


