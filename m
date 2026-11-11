Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9AC606A895
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Nov 2026 14:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sn5hLbJh;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g8mw7nOv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=; b=sn5hLbJhK2xepK
	jOahNvWCeT94mzoN1q4dtN1ms46oNASGrW8r5HovSuVQ1P3o8JkoimLzEPh/Blrqqvr3xOHt7u3Ee
	Ph15qi/xaUO6ue2uINp7leFBneTFiOj3NT5vFRRAt6TY7aK0QwCGWEnwo6EjYAvdjzfBW7lSYV1Jo
	fsF7KEFhZI/KTOK8Z1021JJLCfEcOEqbqwuBcvc5KKaGC40PotpY40osSZrgFBA5Z9PE4eCWwT+6g
	Ssg7tL+xvnhH41Sik/DURluzu1HnalfyFDI1f7QQdUTmsteKNz2AxDByebDpHaay7Qjec4HgWf9VJ
	dPHmv3AqsIQVt3yowWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9ZF-000000070PT-3WtW;
	Wed, 11 Nov 2026 14:44:53 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR9Z3-000000070Fb-3KQs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Nov 2026 14:44:43 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so28432255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Nov 2026 06:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794408280; x=1795013080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
        b=g8mw7nOvCBoDrtv+M2XAXbUXM+mKdCv9IZMTRxyap+iDVXGvBWU8sVOOx+lVTNe6Jz
         9IQdln2nv/nc3eB1FUSPnwa4ofskj0yWgk317P8jAWJixDBoo3iF67K3HaiitLbCtHlB
         Phx+nrqqQGBCbtht0gbHoOwVvA0BQR8yaPnjM7G5wA7oGT5nmnoXMV7Dk+wHzsQ1OJY9
         XTl69Sk1At9Lo6oKXE+zsKqXJx7sWKGmvlVWYX5sutrSp9VdTfqQpSaucB+izVouWZzx
         ilKhZX3niG3g8WW87noJpyv6YD9SYH0JvExhO+W1h8WKAyXP87iTTgn024w/c3hzgXCA
         JKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408280; x=1795013080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LPsq33bOSJgVO/RNV124EKVcCGGrlMvdhjL7wfKrHy8=;
        b=MlKjYYqQLOAzUwFMAp30uTGnHX2riUnM3v9yTDm+rnfdiYR7ZVTttne6YaBBCI6zIO
         7ABvN0z++CH4+T1ymS1//4vUqSmT2QN5mY1uuFQyTM8Jsw1/3/2esllKW6uTzxoaF+Vo
         9R7JYDL4oR5pufi7urABeroQyS9oryM/Izr6a/nZ2NvNFdLiKGOpp/YbmjMsw5Xtpvaz
         xw0qDgwq651xu8UXO1mF1iaxViP9bkgrX/SCi1JknPoeSz7ADS073vmwu6vlwvlYQLSm
         jdgrx9fZdclYfxtgenuECPQgPNHyaXc2n+ICDuV/jStv7NpjSfEMKDTubNa67ff/cGA2
         gNeg==
X-Forwarded-Encrypted: i=1; AL+hErH0bvA4QltsEWBS/bGtfDeUZJ4kvFuoXziryIiE4L6+HsXGqfvqk+Mfs8PSyO0NIJGBQgfe0oZwhZf97pnbAV4h@lists.infradead.org
X-Gm-Message-State: APuU4Z8oqZC8sEb6WDQxXjSTSVOVEo2IG2qok/EV7l5ES/zpDnj3q25b
	6jQWfRwriuTSZnfrVJK0foJITehI22RQl+hhL5vrO7Gup++DiIxZhFmJ
X-Gm-Gg: AYBFou1vRCpnrlZzOOE4WjpW+evIP0kBnV92Em0QFJi6YJiJljEmuJWPv9+3G3IttAm
	xaBQZUcX1jfVKs6J60wGSjeaBpgd1BlVDgxvaBiiVUCdd88Osfoz7Nbg7nKOpTqUg3OHwqadubf
	ir66RvAcLfpghD+pOVzTmvjgJSPCx3ixRTALubTJP5K5Uamok5vGTrk0zdOOTkUMexGzjp5XCbh
	nRH2PYRiF+OQiWCy8kV1o47vQ9Z1Ae9ZkFSJlgybBs6womgMShSCaheErzE1244ZmwX25D668fv
	XUMu0LFJ+aYpOWM7AUHKofV1Ikmh+mkb6cR7hBXC/pLband2xSgAJUqmnwxQn6O4fCkH0/GZKZi
	FecJ9FfcyHdnVVM1oWPOdhLtiMvyzJGPnFsbEAQk62AkzliaGIdry1UDZynWjfJAhId9Zx9vxYf
	7rR+CH4pFtpOykqKxbvd17HrYdlJUveqxz+WpYaoIifbmII+T8B6kxTUy9m+oEoUiirVwd9JhCx
	OMw1UgDokVdDEWn4uUqSZxIx4QN5cVJT5qSX/ScYTc5x7VjAUzwCTedPVvgLd2bTQQc1SH+tLCx
	kMKqJL9vtZMH+kK1AOZRFzm85L3VsPqXdrBje2qeTRfkoADU3sjvYapt
X-Received: by 2002:a05:600c:c83:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4ba0936f386mr49865155e9.24.1794408279927;
        Wed, 11 Nov 2026 06:44:39 -0800 (PST)
Received: from dev.Default ([86.127.229.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08de826asm46656495e9.0.2026.11.11.06.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:44:39 -0800 (PST)
From: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
To: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junyang Han <han.junyang@zte.com.cn>,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next 5/5] net: ethernet: zte: zx279128s: debugfs knobs for the WLAN ring
Date: Wed, 11 Nov 2026 15:44:26 +0100
Message-Id: <20261111144426.1321237-6-isasmendi.agus@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
References: <20261111144426.1321237-1-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_064441_952372_894F8A6D 
X-CRM114-Status: GOOD (  14.21  )
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

wlan_state (counters and port table), wlan_inject_all (inject every
frame of the bound interfaces, as the vendor firmware does, to exercise
the ring and the trap path without flows) and wlan_bind (bind an
interface by name).  Testing aids, kept apart so they can be dropped.

Assisted-by: LLM
Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
---
 drivers/net/ethernet/zte/zx279128s-wlan.c | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/net/ethernet/zte/zx279128s-wlan.c b/drivers/net/ethernet/zte/zx279128s-wlan.c
index 6c6f6a36d34f..29970db47a41 100644
--- a/drivers/net/ethernet/zte/zx279128s-wlan.c
+++ b/drivers/net/ethernet/zte/zx279128s-wlan.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/seq_file.h>
 #include <linux/tcp.h>
+#include <linux/uaccess.h>
 #include <linux/udp.h>
 #include <net/arp.h>
 #include <net/cfg80211.h>
@@ -751,6 +752,38 @@ static int zx_wlan_state_show(struct seq_file *s, void *data)
 	return 0;
 }
 
+/* Bind an interface by name without waiting for a flow (testing) */
+static ssize_t zx_wlan_bind_write(struct file *file, const char __user *ubuf,
+				  size_t count, loff_t *ppos)
+{
+	struct zx_eth_adapter *adapter = file->private_data;
+	char name[IFNAMSIZ + 1];
+	struct net_device *vif;
+	int ret;
+
+	if (count == 0 || count > IFNAMSIZ)
+		return -EINVAL;
+	if (copy_from_user(name, ubuf, count))
+		return -EFAULT;
+	name[count] = 0;
+	strim(name);
+	vif = dev_get_by_name(dev_net(adapter->wlan->napi.dev), name);
+	if (!vif)
+		return -ENODEV;
+	mutex_lock(&adapter->ppe_lock);
+	ret = zx_wlan_is_ap(vif) ? zx_wlan_port_get(adapter->wlan, vif) : -EINVAL;
+	mutex_unlock(&adapter->ppe_lock);
+	dev_put(vif);
+	return ret < 0 ? ret : count;
+}
+
+static const struct file_operations zx_wlan_bind_fops = {
+	.owner	= THIS_MODULE,
+	.open	= simple_open,
+	.write	= zx_wlan_bind_write,
+	.llseek	= noop_llseek,
+};
+
 void zx_wlan_debugfs_init(struct zx_eth_adapter *adapter, struct dentry *dir)
 {
 	if (!adapter->wlan)
@@ -759,6 +792,7 @@ void zx_wlan_debugfs_init(struct zx_eth_adapter *adapter, struct dentry *dir)
 				    zx_wlan_state_show);
 	debugfs_create_bool("wlan_inject_all", 0600, dir,
 			    &adapter->wlan->inject_all);
+	debugfs_create_file("wlan_bind", 0200, dir, adapter, &zx_wlan_bind_fops);
 }
 
 /* ---- init / fini --------------------------------------------------- */
-- 
2.30.2


