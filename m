Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD56D606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 20:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rYZ+mjj2;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fuqrY/1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SCS78tpTYdTFhdyY+WipXI86/bzTlAX6cWgOZmmc0+Y=; b=rYZ+mjj27EEMsmLMTfUy3CB/NR
	LEkiBvAuDxmvbegWIa49CJm4gC+yA3J4pn74EBg0NdSvMP54vWFOFFZELGTggDp0lbvQzBGXQzi20
	G8wFipGtzn3mqEj9dL1ub5XBZNTg82fArMVPQU3LWclg0ZLuPTg9RnROtH/UD/4mV1pF6gevn6l95
	EwPMTTHmQNbc/37EGq9Pl4x4BN6SyKVsJn2oNqGsWQDV4TdSFnN/TdzejxrW0QOPWrweHXZTYzrUM
	ZUXNxQybO05/CUPW+fl3By3AM8YyQ/39yuvf2p6HK4Fo6YCpeMRNo1yUOx2CHzKHRGhh3nETBbn+S
	BTY0jHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJx1-0000000BJDB-3SGN;
	Wed, 25 Nov 2026 20:50:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJwz-0000000BJBe-142P
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 20:50:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 555B561B19;
	Wed, 25 Nov 2026 20:50:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795639844;
	b=M8OdzpVPNbBifoJGuEnBZo7GeRWD3GGHstOGQOAFJK0h8CKTsFFuVo7gucrXGrXOIAPE
	 px9j0K+7V8TEsEdAALMYUq0Ism94pF0ZVkvujvk2o2lecQWvA1BPYlwV57qjkpae24L/W
	 vwIhytXTtKkjFB+X4ZIKc3dus2IaC5JjISTk2xbWFxRJUvW1ez9/y3IWCA7p4ClDW+Clz
	 pe1LaQOc6MSf0Zg4DcQ/32i/YNnRnmofV0LlJsrZK5xHYy7xN9ftwSZcPusAB6x4bcWUo
	 srRe1xBdF20QazOOTR3duPeVVTelSQowxvBGCQU6yqbdspYv24CbvApNTUnYWe76qhA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795639844;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SCS78tpTYdTFhdyY+WipXI86/bzTlAX6cWgOZmmc0+Y=;
	b=tzyFOaGvdjQrgFnS1y7GAwS0GGvU+ggqopGjlZkwXVfvy9jKb0oMlfTQbc/or9CIOR/H
	 otYxsIxo1khRxENz0ROLxZGXwSXGERynxsJqRS9Vbeu8LQr5kvN6ys0Rkoe4JPJqBLLlF
	 UpRDvoinRjaraInyIUgURnbN5zu6vh30gRO/zO2tYmcYc98sg/1Y/43kATZSqUAGn2m8L
	 8du892oTkStDd1qYdbAj2fWI7M6sIOoJH3Ke4ONrtwqkFigZyl6zkdZkauQWDbfD7FZS6
	 i8FhkU+uDCqDUKHIdNtHyuPr8QSgkp3I8XZfkMyuPe9Tq/5L1mrT5yquQ5+5xrMxWPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 196D31F000D0;
	Wed, 25 Nov 2026 20:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795639843;
	bh=SCS78tpTYdTFhdyY+WipXI86/bzTlAX6cWgOZmmc0+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fuqrY/1J+N86QGm+UDK8BRcrKRMiVAz3w+BNeQcLi7GkdrEBSvhFwhng2ZBG+UeF1
	 gNZdhfXaB+L6FtI+9PI3u0SVV1VTSPdTqWe0G/WW57q2t2Pkf73HhxzQ8lq+XrYExA
	 7mfzn+hZBHz4hGVoVvDacJNDfCCC1J+8vrRzyNUwb/I35sQMy7l14EJlHDLq+4D3yI
	 D3xH+RGXp9N7Yxu748cTkY6pqNQQ5y8c0CYvCHPcSbv9BM7k75nvUtueQUYLDpaHOw
	 s2+zkDKryrXDfoW2B3npOWymsuW8sJ17LnffU52GXGd2hqQ94yQ0Iqiy01WdInMhO9
	 96RmypVysF/Ng==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 98B644D04B;
	Wed, 25 Nov 2026 20:50:31 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Wed, 25 Nov 2026 23:50:31 +0300
Subject: [PATCH RFC net-next 3/7] netfilter: flowtable: expose route MTU
 and established TCP context
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-almondplus-offload-rfc-v1-3-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
In-Reply-To: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, 
 coreteam@netfilter.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795639829; l=3324;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=mLPX1GTSxAne24R9ema/fFYxL0PzB5MRcuwULUd51Mo=;
 b=rfU8dFYcmkSUrzpN97eeL+cHaJoM5iboEZOVkw9d79W6LC4hom5cr3RET0XMqIiSwzQUGGHxF
 cdZ5VuOWBsRAVu8duOnmoDJkv4Lt3juxAipUir/lRCKJoeFM83M22VU
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Carry the direction route MTU in the classifier request. Snapshot
established TCP state under the conntrack lock, rejecting dying and
closing flows. The CS7542 backend needs these facts to install its
length and TCP exception guards; flower rewrites alone do not supply
them.

This is an RFC interface proposal. Other flower users leave the added
fields zero.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 include/net/flow_offload.h            |  5 +++++
 net/netfilter/nf_flow_table_offload.c | 25 ++++++++++++++++++++++++-
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/net/flow_offload.h b/include/net/flow_offload.h
index 70a02ee14..0f9783b5c 100644
--- a/include/net/flow_offload.h
+++ b/include/net/flow_offload.h
@@ -699,8 +699,13 @@ struct flow_cls_offload {
 	struct flow_rule *rule;
 	struct flow_stats stats;
 	u32 classid;
+	u16 nf_route_mtu;
+	bool nf_tcp_established;
 };
 
+#define NF_FLOW_CLS_HAS_ROUTE_MTU 1
+u16 nf_flow_offload_route_mtu(const struct flow_cls_offload *cls);
+
 enum offload_act_command  {
 	FLOW_ACT_REPLACE,
 	FLOW_ACT_DESTROY,
diff --git a/net/netfilter/nf_flow_table_offload.c b/net/netfilter/nf_flow_table_offload.c
index 436585922..686781363 100644
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@ -13,6 +13,7 @@
 #include <net/netfilter/nf_conntrack.h>
 #include <net/netfilter/nf_conntrack_acct.h>
 #include <net/netfilter/nf_conntrack_core.h>
+#include <net/netfilter/nf_conntrack_l4proto.h>
 #include <net/netfilter/nf_conntrack_tuple.h>
 
 #define NF_FLOW_RULE_ACTION_MAX	24
@@ -885,6 +886,16 @@ static int nf_flow_offload_alloc(const struct flow_offload_work *offload,
 	return 0;
 }
 
+/* The flowtable records the route MTU independently for each direction. */
+u16 nf_flow_offload_route_mtu(const struct flow_cls_offload *cls)
+{
+	if (!cls || cls->command != FLOW_CLS_REPLACE || !cls->rule)
+		return 0;
+
+	return cls->nf_route_mtu;
+}
+EXPORT_SYMBOL_GPL(nf_flow_offload_route_mtu);
+
 static void nf_flow_offload_init(struct flow_cls_offload *cls_flow,
 				 __be16 proto, int priority,
 				 enum flow_cls_command cmd,
@@ -896,6 +907,7 @@ static void nf_flow_offload_init(struct flow_cls_offload *cls_flow,
 	cls_flow->common.extack = extack;
 	cls_flow->command = cmd;
 	cls_flow->cookie = (unsigned long)tuple;
+	cls_flow->nf_route_mtu = tuple->mtu;
 }
 
 static int nf_flow_offload_tuple(struct nf_flowtable *flowtable,
@@ -914,8 +926,19 @@ static int nf_flow_offload_tuple(struct nf_flowtable *flowtable,
 
 	nf_flow_offload_init(&cls_flow, proto, priority, cmd,
 			     &flow->tuplehash[dir].tuple, &extack);
-	if (cmd == FLOW_CLS_REPLACE)
+	if (cmd == FLOW_CLS_REPLACE) {
 		cls_flow.rule = flow_rule->rule;
+		if (flow->tuplehash[dir].tuple.l4proto == IPPROTO_TCP &&
+		    flow->ct) {
+			spin_lock_bh(&flow->ct->lock);
+			cls_flow.nf_tcp_established =
+				nf_conntrack_tcp_established(flow->ct) &&
+				!nf_ct_is_dying(flow->ct) &&
+				!test_bit(NF_FLOW_TEARDOWN, &flow->flags) &&
+				!test_bit(NF_FLOW_CLOSING, &flow->flags);
+			spin_unlock_bh(&flow->ct->lock);
+		}
+	}
 
 	down_read(&flowtable->flow_block_lock);
 	list_for_each_entry(block_cb, block_cb_list, list) {

-- 
2.53.0



